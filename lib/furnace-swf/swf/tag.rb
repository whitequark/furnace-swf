module Furnace::SWF
  class Tag < BinData::Record
    mandatory_parameter :stream

    endian :little

    REGISTRY = {}

    def self.exists_for?(type)
      REGISTRY.has_key? type
    end

    def self.instantiate(type, parent, stream)
      REGISTRY[type].new({ stream: stream }, parent)
    end

    # DSL

    class << self
      def type(id)
        Tag::REGISTRY[id] = self

        define_method(:type) do
          id
        end
      end
    end

    def initialize_instance
      super
      @stream = @params[:stream]
    end
  end
end