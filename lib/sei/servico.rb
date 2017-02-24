module Sei

  module Servico

    def self.gerar_procedimento(id_unidade, procedimento, documentos = [], procedimentos_relacionados = [], unidades_envio = [], manter_aberto_unidade = 'N',
                  enviar_email_notificacao = 'N', data_retorno_programado = nil, dias_retorno_programado = nil, dias_uteis_retorno_programado = 'N')
      message = {
<<<<<<< HEAD
      
=======
>>>>>>> 3c4f7494303b23be42582699b7688f6e8fdec3cc
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
<<<<<<< HEAD
      
=======
>>>>>>> 3c4f7494303b23be42582699b7688f6e8fdec3cc
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

<<<<<<< HEAD
    def self.incluir_documento_bloco(id_unidade,id_bloco,protocolo_documento)
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        IdBloco: id_bloco,
        ProtocoloDocumento: protocolo_documento
      }
      
      response = Sei::Connection.instance.call :incluir_documento_bloco, message: message
      body = response.body[:incluir_documento_bloco_response][:parametros]
      Sei::Estruturas::RetornoInclusaoDocumentoBloco.new body
    end

    def self.incluir_processo_bloco(id_unidade,id_bloco,protocolo_procedimento)
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        IdBloco: id_bloco,
        ProtocoloProcedimento: protocolo_procedimento
      }
      
      response = Sei::Connection.instance.call :incluir_processo_bloco, message: message
      body = response.body[:incluir_processo_bloco_response][:parametros]
      Sei::Estruturas::RetornoInclusaoProcessoBloco.new body
    end

#metodos não testados ainda
    def self.concluir_processo(id_unidade,protocolo_procedimento)
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        ProtocoloProcedimento: protocolo_procedimento
      }
      
      response = Sei::Connection.instance.call :concluir_processo, message: message
      body = response.body[:concluir_processo_response][:parametros]
      Sei::Estruturas::RetornoConclusaoProcesso.new body

    end

    def self.reabrir_processo(id_unidade,protocolo_procedimento)
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        ProtocoloProcedimento: protocolo_procedimento
      }
      
      response = Sei::Connection.instance.call :reabrir_processo, message: message
      body = response.body[:reabrir_processo_response][:parametros]
      Sei::Estruturas::RetornoBoolean.new body

    end

    def self.retirar_processo_bloco(id_unidade,id_bloco,protocolo_procedimento)
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        IdBloco: id_bloco,
        ProtocoloProcedimento: protocolo_procedimento
      }
      
      response = Sei::Connection.instance.call :retirar_processo_bloco, message: message
      body = response.body[:retirar_processo_bloco_response][:parametros]
      Sei::Estruturas::RetornoBoolean.new body
    end

    def self.atribuir_processo(id_unidade,protocolo_procedimento,id_usuario,sinReabrir = 'N')

      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        ProtocoloProcedimento: protocolo_procedimento,
        IdUsuario: id_usuario,
        SinReabrir: sinReabrir

      }
      
      response = Sei::Connection.instance.call :atribuir_processo, message: message
      body = response.body[:atribuir_processo_response][:parametros]
      Sei::Estruturas::RetornoBoolean.new body
    end

    def self.retirar_documento_bloco(id_unidade,id_bloco,protocolo_documento)
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        IdBloco: id_bloco,
        ProtocoloDocumento: protocolo_documento
      }
      
      response = Sei::Connection.instance.call :retirar_documento_bloco, message: message
      body = response.body[:retirar_documento_bloco_response][:parametros]
      Sei::Estruturas::RetornoBoolean.new body
    end  

    def self.disponibilizar_bloco(id_unidade,id_bloco)
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        IdBloco: id_bloco
      }
      
      response = Sei::Connection.instance.call :disponibilizar_bloco, message: message
      body = response.body[:disponibilizar_bloco_response][:parametros]
      Sei::Estruturas::RetornoBoolean.new body
    end  

    def self.excluir_bloco(id_unidade,id_bloco)
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        IdBloco: id_bloco
      }
      
      response = Sei::Connection.instance.call :excluir_bloco, message: message
      body = response.body[:excluir_bloco_response][:parametros]
      Sei::Estruturas::RetornoBoolean.new body
    end  

    def self.cancelar_documento(id_unidade,protocoloDocumento,motivo)
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        ProtocoloDocumento: protocoloDocumento,
        Motivo: motivo
      }
      
      response = Sei::Connection.instance.call :cancelar_documento, message: message
      body = response.body[:cancelar_documento_response][:parametros]
      Sei::Estruturas::RetornoBoolean.new body
    end  


    def self.listar_usuarios(idUnidade,idUsuario = nil)     
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,

        IdUnidade: idUnidade,
        IdUsuario: idUsuario
      }
      response = Sei::Connection.instance.call :listar_usuarios, message: message
      body = response.body[:listar_usuarios_response][:parametros]
      Sei::Estruturas::RetornoListUsuarios.new body
    end

    def self.consultar_procedimento(idUnidade,protocoloProcedimento,sinRetornarAssuntos = 'N',sinRetornarInteressados = 'N',sinRetornarObservacoes = 'N',sinRetornarAndamentoGeracao = 'N',sinRetornarAndamentoConclusao = 'N')     
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: idUnidade,
        ProtocoloProcedimento: protocoloProcedimento

      }
      response = Sei::Connection.instance.call :consultar_procedimento, message: message
      body = response.body[:consultar_procedimento_response][:parametros]
      Sei::Estruturas::RetornoConsultarProcedimento.new body
    end


#até aqui



    def self.listar_unidades(idTipoProcedimento = nil,idSerie = nil)     
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdTipoProcedimento: idTipoProcedimento,
        IdSerie: idSerie
      }
      response = Sei::Connection.instance.call :listar_unidades, message: message
      body = response.body[:listar_unidades_response][:parametros]
      Sei::Estruturas::RetornoListUnidades.new body
    end

    def self.gerar_bloco(id_unidade, tipo, descricao,unidadesDisponibilizacao = [], documentos = [], sinDisponibilizar = 'N')
      message = {      
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        Tipo: tipo,
        Descricao: descricao,
        UnidadesDisponibilizacao: unidadesDisponibilizacao,
        SinDisponibilizar: sinDisponibilizar
      }
      response = Sei::Connection.instance.call :gerar_bloco, message: message
      
      body = response.body[:gerar_bloco_response][:parametros]
      Sei::Estruturas::RetornoGeracaoBloco.new body
    end
=======
>>>>>>> 3c4f7494303b23be42582699b7688f6e8fdec3cc
  end

end