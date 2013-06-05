module Furnace::SWF
  class ProductInfoTag < Tag
    type 41

    uint32  :product
    uint32  :edition
    uint8   :major_version
    uint8   :minor_version
    uint32  :build_low
    uint32  :build_high
    uint64  :compilation_date
  end
end
