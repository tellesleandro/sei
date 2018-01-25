module Sei

  module Estruturas

    class RetornoUnidade < ::Valuable

      has_value :id_unidade
      has_value :sigla
      has_value :descricao

      def initialize(params)
        self.id_unidade = params[:id_unidade]
        self.sigla = params[:sigla]
        self.descricao = params[:descricao]
        
        initialize_attributes
      end
    end

  end

end