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