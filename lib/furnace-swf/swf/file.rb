require 'zlib'

module Furnace::SWF
  class File < BinData::Record
    header :header
    stream :stream

    def do_read(io)
      instantiate_all_objs

      header = find_obj_for_name(:header)
      stream = find_obj_for_name(:stream)

      header.do_read(io)

      case header.signature
      when 'FWS'
        stream.do_read io
      when 'CWS'
        uncompressed = Zlib.inflate(io.read_all_bytes)
        stream.do_read BinData::IO.new(StringIO.new(uncompressed))
      else
        raise ArgumentError, "invalid signature"
      end
    end

    def do_write(io)
      instantiate_all_objs

      header = find_obj_for_name(:header)
      stream = find_obj_for_name(:stream)

      header.signature   = 'FWS'
      header.file_length = header.num_bytes + stream.real_num_bytes

      header.do_write(io)
      stream.do_write(io)
    end
  end
end
