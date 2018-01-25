module Sei

  module Estruturas

    class RetornoGeracaoBloco < ::Valuable

      has_value :bloco_gerado

      def initialize(params)
        self.bloco_gerado = params
        initialize_attributes
      end

    end

  end

end