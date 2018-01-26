module Sei

  module Estruturas

    class RetornoConsultarProcedimento < ::Valuable

      has_value :id_procedimento
      has_value :procedimento_formatado
      has_value :especificacao
      has_value :data_autuacao
      has_value :link_acesso
      has_value :tipo_procedimento      

      def initialize(params)
        self.id_procedimento = params[:id_procedimento]
        self.procedimento_formatado = params[:procedimento_formatado]
        self.especificacao = params[:especificacao]
        self.data_autuacao = params[:data_autuacao]
        self.link_acesso = params[:link_acesso]
        self.tipo_procedimento = params[:tipo_procedimento]
        initialize_attributes
      end

    end

  end

end