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

    def self.retirar_processo_bloco(id_unidade, id_bloco, protocolo_procedimento)
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

    def self.atribuir_processo(id_unidade, protocolo_procedimento, id_usuario, sin_reabrir = 'N')
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        ProtocoloProcedimento: protocolo_procedimento,
        IdUsuario: id_usuario,
        SinReabrir: sin_reabrir
      }
      response = Sei::Connection.instance.call :atribuir_processo, message: message
      body = response.body[:atribuir_processo_response][:parametros]
      Sei::Estruturas::RetornoBoolean.new body
    end

    def self.retirar_documento_bloco(id_unidade, id_bloco, protocolo_documento)
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

    def self.disponibilizar_bloco(id_unidade, id_bloco)
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

    def self.excluir_bloco(id_unidade, id_bloco)
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

    def self.cancelar_documento(id_unidade, protocolo_documento, motivo)
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        ProtocoloDocumento: protocolo_documento,
        Motivo: motivo
      }
      response = Sei::Connection.instance.call :cancelar_documento, message: message
      body = response.body[:cancelar_documento_response][:parametros]
      Sei::Estruturas::RetornoBoolean.new body
    end  

    def self.listar_usuarios(id_unidade, id_usuario = nil)     
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        IdUsuario: id_usuario
      }
      response = Sei::Connection.instance.call :listar_usuarios, message: message
      body = response.body[:listar_usuarios_response][:parametros]
      Sei::Estruturas::RetornoListUsuarios.new body
    end

    def self.consultar_procedimento(id_unidade, protocolo_procedimento, sin_retornar_assuntos = 'N', sin_retornar_interessados = 'N', sin_retornar_observacoes = 'N', sin_retornar_andamento_geracao = 'N', sin_retornar_andamento_conclusao = 'N')
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        ProtocoloProcedimento: protocolo_procedimento,
        SinRetornarAssuntos: sin_retornar_assuntos,
        SinRetornarInteressados: sin_retornar_interessados,
        SinRetornarObservacoes: sin_retornar_observacoes,
        SinRetornarAndamentoGeracao: sin_retornar_andamento_geracao,
        SinRetornarAndamentoConclusao: sin_retornar_andamento_conclusao
      }
      response = Sei::Connection.instance.call :consultar_procedimento, message: message
      body = response.body[:consultar_procedimento_response][:parametros]
      Sei::Estruturas::RetornoConsultarProcedimento.new body
    end

    def self.listar_unidades(id_tipo_procedimento = nil,id_serie = nil)     
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdTipoProcedimento: id_tipo_procedimento,
        IdSerie: id_serie
      }
      response = Sei::Connection.instance.call :listar_unidades, message: message
      body = response.body[:listar_unidades_response][:parametros]
      Sei::Estruturas::RetornoListUnidades.new body
    end

    def self.gerar_bloco(id_unidade, tipo, descricao,unidades_disponibilizacao = [], documentos = [], sin_disponibilizar = 'N')
      message = {      
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        Tipo: tipo,
        Descricao: descricao,
        UnidadesDisponibilizacao: unidades_disponibilizacao,
        SinDisponibilizar: sin_disponibilizar
      }
      response = Sei::Connection.instance.call :gerar_bloco, message: message      
      body = response.body[:gerar_bloco_response][:parametros]
      Sei::Estruturas::RetornoGeracaoBloco.new body
    end

    def self.consultar_documento(id_unidade, protocolo_documento, sin_retornar_andamento_geracao = 'N', sin_retornar_assinaturas = 'N', sin_retornar_publicacao = 'N')
      message = {
        SiglaSistema: Sei.configuration.sigla,
        IdentificacaoServico: Sei.configuration.identificacao,
        IdUnidade: id_unidade,
        ProtocoloDocumento: protocolo_documento,
        SinRetornarAndamentoGeracao: sin_retornar_andamento_geracao,
        SinRetornarAssinaturas: sin_retornar_assinaturas,
        SinRetornarPublicacao: sin_retornar_publicacao
      }
      response = Sei::Connection.instance.call :consultar_documento, message: message
      body = response.body[:consultar_documento_response][:parametros]
      Sei::Estruturas::RetornoConsultarDocumento.new body
    end

  end

end