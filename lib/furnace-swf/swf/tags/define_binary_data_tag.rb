module Furnace::SWF
  class DefineBinaryTag < Tag
    type 87

    uint16  :tag
    uint32  :reserved
    string  :data,    :read_length => lambda { parent.real_length - 6 }
  end
end