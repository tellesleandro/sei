module Sei

  module Estruturas

    class RetornoInclusaoDocumentoBloco < ::Valuable

      has_value :status

      def initialize(params)
        self.status = params
        initialize_attributes
      end
    end

  end

end