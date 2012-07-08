module Furnace::SWF
  class Stream < BinData::Record
    endian :little

    rect   :frame_size
    uint8  :frame_rate_lo
    uint8  :frame_rate_hi
    uint16 :frame_count

    array  :tag_wrappers, :type => :tag_wrapper, :read_until => :eof

    def frame_rate
      BigDecimal.new(frame_rate_hi) +
          BigDecimal.new(frame_rate_lo) / 100
    end

    def tags(*types)
     tag_wrappers.select { |tw| types.any? { |type| tw.content.is_a? type } }.map(&:content)
    end

    def real_num_bytes
      num_bytes + tag_wrappers.map(&:content_size).reduce(0, :+)
    end
  end
end