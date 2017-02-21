module Sei

  module Estruturas

    class DocumentoBloco
 
      def id_unidade(id_unidade)
        @tipo = id_unidade
        self
      end

      def id_bloco(id_bloco)
        @id_bloco = id_bloco
        self
      end

      def protocolo_documento(protocolo_documento)
        @protocolo_documento = protocolo_documento
        self
      end


      def to_h
        {
          tipo: @tipo,
          id_procedimento: @id_procedimento,
          id_serie: @id_serie,
          numero: @numero,
          data: @data,
          descricao: @descricao,
          remetente: @remetente,
          interessados: @interessados.nil? ? {} : @interessados,
          destinatarios: @destinatarios.nil? ? {} : @destinatarios,
          observacao: @observacao,
          nome_arquivo: @nome_arquivo,
          conteudo: @conteudo,
          conteudo_mtom: @conteudo_mtom,
          nivel_de_acesso: @nivel_de_acesso
        }
      end

    end

  end

end