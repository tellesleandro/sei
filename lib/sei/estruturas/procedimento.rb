module Sei

  module Estruturas

    class Procedimento

      def id_tipo_procedimento(id_tipo_procedimento)
        @id_tipo_procedimento = id_tipo_procedimento
        self
      end

      def especificacao(especificacao)
        @especificacao = especificacao
        self
      end

      def assunto(codigo_estruturado, descricao)
        @assuntos ||= []
        @assuntos << {
          assunto: {
            codigo_estruturado: codigo_estruturado,
            descricao: descricao
          }
        }
        self
      end

      def interessado(sigla, nome)
        @interessados ||= []
        @interessados << {
          interessado: {
            sigla: sigla,
            nome: nome
          }
        }
        self
      end

      def observacao(observacao)
        @observacao = observacao
        self
      end

      def nivel_de_acesso(nivel_de_acesso)
        @nivel_de_acesso = nivel_de_acesso
        self
      end

      def to_h
        {
          id_tipo_procedimento: @id_tipo_procedimento,
          especificacao: @especificacao,
          assuntos: @assuntos.nil? ? {} : @assuntos,
          interessados: @interessados.nil? ? {} : @interessados,
          observacao: @observacao,
          nivel_de_acesso: @nivel_de_acesso
        }
      end

    end

  end

end