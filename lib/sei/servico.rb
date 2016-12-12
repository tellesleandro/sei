module Sei

  module Servico

    def self.gerar_procedimento(id_unidade, procedimento, documentos = [], procedimentos_relacionados = [], unidades_envio = [], manter_aberto_unidade = 'N',
                  enviar_email_notificacao = 'N', data_retorno_programado = nil, dias_retorno_programado = nil, dias_uteis_retorno_programado = 'N')
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        Procedimento: procedimento.to_h,
        Documentos: documentos.empty? ? {} : {documento: documentos.map{|documento| documento.to_h}},
        ProcedimentosRelacionados: procedimentos_relacionados.empty? ? {} : {procedimento_relacionado: procedimentos_relacionados.map{|procedimentos_relacionado| procedimentos_relacionado.to_h}},
        UnidadesEnvio: unidades_envio.empty? ? {} : {unidade_envio: unidades_envio.map{|unidade_envio| unidade_envio.to_message}},
        SinManterAbertoUnidade: manter_aberto_unidade,
        SinEnviarEmailNotificacao: enviar_email_notificacao,
        DataRetornoProgramado: data_retorno_programado,
        DiasRetornoProgramado: dias_retorno_programado,
        SinDiasUteisRetornoProgramado: dias_uteis_retorno_programado
      }
      response = Sei::Connection.instance.call :gerar_procedimento, message: message
      body = response.body[:gerar_procedimento_response][:parametros]
      Sei::Estruturas::RetornoGeracaoProcedimento.new body
    end

    def self.incluir_documento(id_unidade, documento)
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        Documento: documento.to_h
      }
      response = Sei::Connection.instance.call :incluir_documento, message: message
      body = response.body[:incluir_documento_response][:parametros]
      Sei::Estruturas::RetornoInclusaoDocumento.new body
    end

  end

end