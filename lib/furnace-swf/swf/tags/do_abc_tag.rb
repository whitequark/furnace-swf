module Furnace::SWF
  class DoABCTag < Tag
    type 72

    string  :bytecode, :read_length => lambda { parent.real_length }

    def name
      "<DoABCTag>"
    end

    def flags
      0
    end
  end
end