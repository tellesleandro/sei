module Sei

  module Estruturas

    class RetornoBoolean < ::Valuable

      has_value :status

      def initialize(params)
        self.status = params
        initialize_attributes
      end
    end

  end

end