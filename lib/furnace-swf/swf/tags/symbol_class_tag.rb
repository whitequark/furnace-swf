module Furnace::SWF
  class SymbolClassTag < Tag
    type 76

    uint16  :num_symbols, :value => lambda { symbols.count }
    array   :symbols,     :initial_length => :num_symbols do
      uint16  :tag
      stringz :name
    end
  end
end