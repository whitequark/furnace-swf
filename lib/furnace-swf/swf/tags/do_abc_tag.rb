module Furnace::SWF
  class DoABCTag < Tag
    type 82

    uint32  :flags
    stringz :name
    string  :bytecode, :read_length => lambda { parent.real_length - 4 - name.length - 1 }
  end
end