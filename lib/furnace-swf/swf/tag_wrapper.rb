module Furnace::SWF
  class TagWrapper < BinData::Record
    endian :little

    uint16 :type_and_length
    int32  :long_length,     :onlyif => lambda { short_length == 0x3f }

    attr_accessor :content

    # Accessors for braindead format.

    def type
      type_and_length >> 6
    end

    def type=(value)
      self.type_and_length = (type_and_length & 0x3f) | (value << 6)
    end

    def short_length
      type_and_length & 0x3f
    end

    def short_length=(value)
      self.type_and_length = (type_and_length & 0xfffc) | (value & 0x3f)
    end

    def real_length
      short_length == 0x3f ? long_length : short_length
    end

    def real_length=(value)
      if value >= 0x3f
        self.short_length = 0x3f
        self.long_length  = value
      else
        self.short_length = value
        self.long_length  = 0
      end
    end

    # Nested reads/writes.

    def do_read(io)
      super

      orig_offset = io.offset

      if Tag.exists_for?(type)
        @content  = Tag.instantiate(type, self, parent)
        @content.do_read io

        if io.offset - orig_offset != real_length
          raise "Invalid tag #{@content}"
        end
      else
        @content  = io.readbytes(real_length)
      end
    end

    def do_write(io)
      super

      if Tag.exists_for?(type)
        @content.do_write io
      else
        io.writebytes @content
      end
    end

    def do_num_bytes
      self.real_length = content_size

      super
    end

    def content_size
      if @content.is_a? Tag
        @content.num_bytes
      else
        @content.length
      end
    end

    def debug_name_of(child)
      if child.is_a?(Tag)
        "#{debug_name}.content"
      else
        super
      end
    end
  end
end