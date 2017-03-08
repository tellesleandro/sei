module Sei

  module Estruturas

    class RetornoUsuario < ::Valuable

      has_value :idUsuario
      has_value :sigla
      has_value :nome

      def initialize(params)
        self.idUsuario = params[:id_usuario]
        self.sigla = params[:sigla]
        self.nome = params[:nome]
        initialize_attributes
      end

    end

  end

end