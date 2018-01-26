module Sei

  module Estruturas

    class RetornoConsultarDocumento < ::Valuable

      has_value :id_procedimento
      has_value :procedimento_formatado
      has_value :id_documento
      has_value :documento_formatado
      has_value :link_acesso
      has_value :serie
      has_value :numero
      has_value :data
      has_value :unidade_elaboradora
      has_value :andamento_geracao
      has_value :assinaturas
      has_value :publicacao
      
      def initialize(params)
        self.id_procedimento = params[:id_procedimento]
        self.procedimento_formatado = params[:procedimento_formatado]
        self.id_documento = params[:id_documento]
        self.documento_formatado = params[:documento_formatado]
        self.link_acesso = params[:link_acesso]
        self.serie = params[:serie]
        self.numero = params[:numero]
        self.data = params[:data]
        self.unidade_elaboradora = params[:unidade_elaboradora]
        self.andamento_geracao = params[:andamento_geracao]
        self.assinaturas = params[:assinaturas]
        self.publicacao = params[:publicacao]
        initialize_attributes
      end

    end

  end

end