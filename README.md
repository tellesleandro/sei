# SEI!

Esta gem facilita o acesso ao webservice do SEI!. Ela possui a implementação dos métodos gerar_procedimento e incluir_documento. O retorno do webservice é automaticamente associado às classes de retorno que possuem os atributos retornados por cada serviço. Estes atributos são acessados através de assessores da classe.

## Instalação

Adicione esta linha no Gemfile da sua aplicação:

```ruby
gem 'sei'
```

E execute:

    $ bundle

Ou instale através do seguinte comando:

    $ gem install sei

## Uso

A classe test/sei_test.rb possui casos de teste que podem ser utilizados como exemplo para chamada dos serviços.

Antes de chamar os métodos dos serviços, é necessário configurar a gem através do comando:

```ruby

Sei.configure do |config|
  config.wsdl = ENV['SEI_CONFIG_WSDL']
  config.follow_redirects = true
  config.pretty_print_xml = true
  config.sigla = ENV['SEI_CONFIG_SIGLA']
  config.identificacao = ENV['SEI_CONFIG_IDENTIFICACAO']
end

```
onde

config.wsdl é o endereço do WSDL do SEI, por exemplo http[s]://[servidor php]/sei/controlador_ws.php?servico=sei';
config.follow_redirects indica para a biblioteca 'savon' que ela deve seguir as respostas 'redirect' devolvidas pelo servidor;
config.pretty_print_xml indica para a biblioteca 'savon' que as mensagens XML geradas devem ser impressas no console de forma formatada;
config.sigla é a sigla do sistema configurada no SEI, através do menu administração -> sistemas;
config.identificacao é a identificação do serviço configurado no SEI, através do menu administração -> sistemas;

Exemplo:

```ruby

procedimento = Sei::Estruturas::Procedimento.new
                .id_tipo_procedimento(id_tipo_procedimento)
                .especificacao(especificacao)
                .assunto(codigo_estruturado, descricao)
                .interessado(sigla, nome)
                .observacao(observacao)
                .nivel_de_acesso(nivel_de_acesso)
    
retorno_geracao_procedimento = Sei::Servico.gerar_procedimento(
                                  id_unidade,
                                  procedimento,
                                  documentos,
                                  procedimentos_relacionados,
                                  unidades_envio,
                                  manter_aberto_unidade,
                                  enviar_email_notificacao,
                                  data_retorno_programado,
                                  dias_retorno_programado,
                                  dias_uteis_retorno_programado)

puts retorno_geracao_procedimento.id_procedimento

```

## Desenvolvimento

Após checar o repositório, execute `bin/setup` para instalar as dependências. Depois, execute `rake test` para rodar os testes. É possível também executar `bin/console` para carregar o prompt interativo que permite testar a gem na linha de comando.

Para instalar esta gem na sua máquina local, execute `bundle exec rake install`. Para publicar uma nova versão, atualize o número da versão em `version.rb` e execute `bundle exec rake release`. Isto criará uma tag git para a versão. Envie (push) os commits e tags e envie (push) o arquivo `.gem` para [rubygems.org](https://rubygems.org).

## Contribuindo

Indicação de bugs e pull requests são bem-vindos no GitHub (https://github.com/tellesleandro/sei). Este projeto tem a intenção de ser seguro e incentiva a colaboração. É esperado que os contribuidores sigam o código de conduta [Contributor Covenant](http://contributor-covenant.org).

## Licença/License

Esta gem está disponível como código aberto dentro dos termos da [MIT License](http://opensource.org/licenses/MIT).

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

