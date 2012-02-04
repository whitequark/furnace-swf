module Furnace::SWF
  class Header < BinData::Record
    endian :little

    string :signature,   :length => 3
    uint8  :version
    uint32 :file_length
  end
end