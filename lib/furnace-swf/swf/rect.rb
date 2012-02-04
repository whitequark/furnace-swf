module Furnace::SWF
  class Rect < BinData::Record
    bit5 :num_bits
    sbit :x_min,    :length => :num_bits
    sbit :x_max,    :length => :num_bits
    sbit :y_min,    :length => :num_bits
    sbit :y_max,    :length => :num_bits
  end
end