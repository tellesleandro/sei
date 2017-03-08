module Sei

  module Estruturas

    class RetornoListUnidades < ::Valuable

      has_collection :retorno_list_unidades, klass: RetornoUnidade

      def initialize(params)        

        self.retorno_list_unidades = []          
          item = params[:item]
          if item.is_a?(Hash)
            self.retorno_list_unidades << Sei::Estruturas::RetornoUnidade.new(item)
          elsif item.is_a?(Array)
            item.each do |retorno_lista_unidades|                      
              self.retorno_list_unidades << Sei::Estruturas::RetornoUnidade.new(retorno_lista_unidades)
            end
          
          end        

        initialize_attributes
      end
      def teste(params)
        debugger
      end
    end

  end

end