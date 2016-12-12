module Sei

  module Estruturas

    class RetornoGeracaoProcedimento < ::Valuable

      has_value :id_procedimento
      has_value :procedimento_formatado
      has_value :link_acesso
      has_collection :retorno_inclusao_documentos, klass: RetornoInclusaoDocumento

      def initialize(params)
        self.id_procedimento = params[:id_procedimento]
        self.procedimento_formatado = params[:procedimento_formatado]
        self.link_acesso = params[:link_acesso]
        self.retorno_inclusao_documentos = []
        if params[:retorno_inclusao_documentos] && params[:retorno_inclusao_documentos][:item]
          item = params[:retorno_inclusao_documentos][:item]
          if item.is_a?(Hash)
            self.retorno_inclusao_documentos << Sei::Estruturas::RetornoInclusaoDocumento.new(item)
          elsif item.is_a?(Array)
            item.each do |retorno_inclusao_documento|
              self.retorno_inclusao_documentos << Sei::Estruturas::RetornoInclusaoDocumento.new(retorno_inclusao_documento)
            end
          end
        end
        initialize_attributes
      end

    end

  end

end