module Furnace::SWF
  class Sbit < BinData::BasePrimitive
    mandatory_parameter :length

    def do_write(io)
      io.writebits(_value, eval_parameter(:length), :big)
    end

    def do_num_bytes
      eval_parameter(:length) / 8.0
    end

    def read_and_return_value(io)
      io.readbits(eval_parameter(:length), :big)
    end

    def sensible_default
      0
    end
  end
end