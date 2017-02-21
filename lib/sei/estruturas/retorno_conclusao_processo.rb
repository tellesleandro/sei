module Sei

  module Estruturas

    class RetornoConclusaoProcesso < ::Valuable

      has_value :status

      def initialize(params)
        self.status = params
        initialize_attributes
      end
    end

  end

end