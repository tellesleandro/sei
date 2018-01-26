require 'test_helper'

describe 'sei' do

  before do
    config_file = File.join(File.dirname(__FILE__), 'config.yml')
    settings = File.exists?(config_file) ? YAML::load_file(config_file) : {}
    Sei.configure do |config|
      config.wsdl = settings['wsdl'] || ENV['SEI_CONFIG_WSDL']
      config.follow_redirects = true
      config.pretty_print_xml = true
      config.sigla = settings['sigla'] || ENV['SEI_CONFIG_SIGLA']
      config.identificacao = settings['identificacao'] || ENV['SEI_CONFIG_IDENTIFICACAO']
    end
  end

  it 'tem um número de versão' do
    refute_nil ::Sei::VERSION
  end

  it 'gera um procedimento sem documento' do
    procedimento = Sei::Estruturas::Procedimento.new
                    .id_tipo_procedimento('20')
                    .especificacao('Especificação do processo')
                    .assunto('01.01.01', 'Licitação')
                    .interessado('leandro.telles', 'Leandro Telles')
                    .observacao('Observação do webservice')
                    .nivel_de_acesso('0')
    
    retorno_geracao_procedimento = Sei::Servico.gerar_procedimento(
                                      '110000949',
                                      procedimento,
                                      documentos = [],
                                      procedimentos_relacionados = [],
                                      unidades_envio = [],
                                      manter_aberto_unidade = 'N',
                                      enviar_email_notificacao = 'N',
                                      data_retorno_programado = nil,
                                      dias_retorno_programado = nil,
                                      dias_uteis_retorno_programado = 'N')

    refute_nil retorno_geracao_procedimento.id_procedimento
  end

  it 'gera um procedimento com 1 documento gerado' do
    procedimento = Sei::Estruturas::Procedimento.new
                    .id_tipo_procedimento('20')
                    .especificacao('Especificação do processo')
                    .assunto('01.01.01', 'Licitação')
                    .interessado('leandro.telles', 'Leandro Telles')
                    .observacao('Observação do webservice')
                    .nivel_de_acesso('0')
    documentos = [
      Sei::Estruturas::Documento.new
        .tipo('G')
        .id_serie('20')
        .descricao('Descrição do documento 1')
        .remetente('Remetente do documento 1')
        .observacao('Observação do documento 1')
        .conteudo('Conteúdo do documento 1')
    ]

    retorno_geracao_procedimento = Sei::Servico.gerar_procedimento(
                                      '110000949',
                                      procedimento,
                                      documentos,
                                      procedimentos_relacionados = [],
                                      unidades_envio = [],
                                      manter_aberto_unidade = 'N',
                                      enviar_email_notificacao = 'N',
                                      data_retorno_programado = nil,
                                      dias_retorno_programado = nil,
                                      dias_uteis_retorno_programado = 'N')

    refute_nil retorno_geracao_procedimento.id_procedimento
  end

  it 'gera um procedimento com 2 documentos gerados' do
    procedimento = Sei::Estruturas::Procedimento.new
                    .id_tipo_procedimento('20')
                    .especificacao('Especificação do processo')
                    .assunto('01.01.01', 'Licitação')
                    .interessado('leandro.telles', 'Leandro Telles')
                    .observacao('Observação do webservice')
                    .nivel_de_acesso('0')
    documentos = [
      Sei::Estruturas::Documento.new
        .tipo('G')
        .id_serie('20')
        .descricao('Descrição do documento 1')
        .remetente('Remetente do documento 1')
        .observacao('Observação do documento 1')
        .conteudo('Conteúdo do documento 1'),
      Sei::Estruturas::Documento.new
        .tipo('G')
        .id_serie('20')
        .descricao('Descrição do documento 2')
        .remetente('Remetente do documento 2')
        .observacao('Observação do documento 2')
        .conteudo('Conteúdo do documento 2')
    ]

    retorno_geracao_procedimento = Sei::Servico.gerar_procedimento(
                                      '110000949',
                                      procedimento,
                                      documentos,
                                      procedimentos_relacionados = [],
                                      unidades_envio = [],
                                      manter_aberto_unidade = 'N',
                                      enviar_email_notificacao = 'N',
                                      data_retorno_programado = nil,
                                      dias_retorno_programado = nil,
                                      dias_uteis_retorno_programado = 'N')

    refute_nil retorno_geracao_procedimento.id_procedimento
  end

  it 'gera um procedimento com 1 documento recebido' do
    procedimento = Sei::Estruturas::Procedimento.new
                    .id_tipo_procedimento('20')
                    .especificacao('Especificação do processo')
                    .assunto('01.01.01', 'Licitação')
                    .interessado('leandro.telles', 'Leandro Telles')
                    .observacao('Observação do webservice')
                    .nivel_de_acesso('0')
    documentos = [
      Sei::Estruturas::Documento.new
        .tipo('R')
        .id_serie('20')
        .numero('Nome na árvore')
        .data(Date.today)
        .remetente('Remetente do documento')
        .nome_arquivo('ws-manual.pdf')
        .conteudo(File.read('./test/ws-manual.pdf'))
    ]

    retorno_geracao_procedimento = Sei::Servico.gerar_procedimento(
                                      '110000949',
                                      procedimento,
                                      documentos,
                                      procedimentos_relacionados = [],
                                      unidades_envio = [],
                                      manter_aberto_unidade = 'N',
                                      enviar_email_notificacao = 'N',
                                      data_retorno_programado = nil,
                                      dias_retorno_programado = nil,
                                      dias_uteis_retorno_programado = 'N')

    refute_nil retorno_geracao_procedimento.id_procedimento
  end

  it 'gera um procedimento com 2 documentos recebidos' do
    procedimento = Sei::Estruturas::Procedimento.new
                    .id_tipo_procedimento('20')
                    .especificacao('Especificação do processo')
                    .assunto('01.01.01', 'Licitação')
                    .interessado('leandro.telles', 'Leandro Telles')
                    .observacao('Observação do webservice')
                    .nivel_de_acesso('0')
    documentos = [
      Sei::Estruturas::Documento.new
        .tipo('R')
        .id_serie('20')
        .numero('Nome na árvore')
        .data(Date.today)
        .remetente('Remetente do documento')
        .nome_arquivo('ws-manual.pdf')
        .conteudo(File.read('./test/ws-manual.pdf')),
      Sei::Estruturas::Documento.new
        .tipo('R')
        .id_serie('20')
        .numero('Nome na árvore')
        .data(Date.today)
        .remetente('Remetente do documento')
        .nome_arquivo('logo-sei.png')
        .conteudo(File.read('./test/logo-sei.png'))
    ]

    retorno_geracao_procedimento = Sei::Servico.gerar_procedimento(
                                      '110000949',
                                      procedimento,
                                      documentos,
                                      procedimentos_relacionados = [],
                                      unidades_envio = [],
                                      manter_aberto_unidade = 'N',
                                      enviar_email_notificacao = 'N',
                                      data_retorno_programado = nil,
                                      dias_retorno_programado = nil,
                                      dias_uteis_retorno_programado = 'N')

    refute_nil retorno_geracao_procedimento.id_procedimento
  end

  it 'gera um procedimento e adiciona 1 documento gerado' do
    procedimento = Sei::Estruturas::Procedimento.new
                    .id_tipo_procedimento('20')
                    .especificacao('Especificação do processo')
                    .assunto('01.01.01', 'Licitação')
                    .interessado('leandro.telles', 'Leandro Telles')
                    .observacao('Observação do webservice')
                    .nivel_de_acesso('0')
    
    retorno_geracao_procedimento = Sei::Servico.gerar_procedimento(
                                      '110000949',
                                      procedimento,
                                      documentos = [],
                                      procedimentos_relacionados = [],
                                      unidades_envio = [],
                                      manter_aberto_unidade = 'N',
                                      enviar_email_notificacao = 'N',
                                      data_retorno_programado = nil,
                                      dias_retorno_programado = nil,
                                      dias_uteis_retorno_programado = 'N')

    documento =
      Sei::Estruturas::Documento.new
        .tipo('G')
        .id_procedimento(retorno_geracao_procedimento.id_procedimento)
        .id_serie('20')
        .descricao('Descrição do documento 1')
        .remetente('Remetente do documento 1')
        .observacao('Observação do documento 1')
        .conteudo('Conteúdo do documento 1')

    retorno_inclusao_documento = Sei::Servico.incluir_documento(
                                    '110000949',
                                    documento)

    refute_nil retorno_inclusao_documento.id_documento
  end

  it 'gera um procedimento com 1 documento e consulta o documento' do
    procedimento = Sei::Estruturas::Procedimento.new
                    .id_tipo_procedimento('20')
                    .especificacao('Especificação do processo')
                    .assunto('01.01.01', 'Licitação')
                    .interessado('leandro.telles', 'Leandro Telles')
                    .observacao('Observação do webservice')
                    .nivel_de_acesso('0')
    documentos = [
      Sei::Estruturas::Documento.new
        .tipo('G')
        .id_serie('20')
        .descricao('Descrição do documento 1')
        .remetente('Remetente do documento 1')
        .observacao('Observação do documento 1')
        .conteudo('Conteúdo do documento 1')
    ]

    retorno_geracao_procedimento = Sei::Servico.gerar_procedimento(
                                      '110000949',
                                      procedimento,
                                      documentos,
                                      procedimentos_relacionados = [],
                                      unidades_envio = [],
                                      manter_aberto_unidade = 'N',
                                      enviar_email_notificacao = 'N',
                                      data_retorno_programado = nil,
                                      dias_retorno_programado = nil,
                                      dias_uteis_retorno_programado = 'N')

    numero_documento = retorno_geracao_procedimento.retorno_inclusao_documentos[0].documento_formatado

    retorno_consultar_documento = Sei::Servico.consultar_documento(
                                    '110000949',
                                    numero_documento)

    refute_nil retorno_consultar_documento.id_procedimento
  end

end
