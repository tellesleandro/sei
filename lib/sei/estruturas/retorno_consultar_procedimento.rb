module Sei

  module Estruturas

    class RetornoConsultarProcedimento < ::Valuable

      has_value :idProcedimento
      has_value :procedimentoFormatado
      has_value :especificacao
      has_value :dataAutuacao
      has_value :linkAcesso
      has_value :tipoProcedimento
      

      def initialize(params)
        self.idProcedimento = params[:idProcedimento]
        self.procedimentoFormatado = params[:procedimentoFormatado]
        self.especificacao = params[:especificacao]
        self.dataAutuacao = params[:dataAutuacao]
        self.linkAcesso = params[:linkAcesso]
        self.tipoProcedimento = params[:tipoProcedimento]
        initialize_attributes
      end

    end

  end

end