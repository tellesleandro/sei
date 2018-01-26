require 'date'
require 'base64'
require 'savon'
require 'valuable'
require 'gem_config'

require 'sei/connection'
require 'sei/printer'
require 'sei/servico'
require 'sei/version'

require 'sei/estruturas/documento'
require 'sei/estruturas/procedimento'
require 'sei/estruturas/retorno_inclusao_documento'
require 'sei/estruturas/retorno_geracao_procedimento'
require 'sei/estruturas/retorno_unidade'
require 'sei/estruturas/retorno_list_unidades'
require 'sei/estruturas/retorno_geracao_bloco'
require 'sei/estruturas/retorno_inclusao_documento_bloco'
require 'sei/estruturas/retorno_inclusao_processo_bloco'
require 'sei/estruturas/retorno_conclusao_processo'
require 'sei/estruturas/retorno_boolean'
require 'sei/estruturas/retorno_usuario'
require 'sei/estruturas/retorno_list_usuarios'
require 'sei/estruturas/retorno_consultar_procedimento'
require 'sei/estruturas/retorno_consultar_documento'

module Sei

  include GemConfig::Base

  with_configuration do
    has :wsdl, classes: String
    has :follow_redirects
    has :pretty_print_xml
    has :sigla, classes: String
    has :identificacao, classes: String
  end
  
end