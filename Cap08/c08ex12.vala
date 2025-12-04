// C08EX12

void pausa() {
    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}

class Pessoa {
    public string nome;
    public ushort idade;

    public bool lerArq(DataInputStream dis) {
        try {
            uint64 tamanho = dis.read_uint64();
            
            if (tamanho == 0) 
                return false;

            Bytes bytes = dis.read_bytes((size_t) tamanho);

            nome = (string) bytes.get_data();
            idade = dis.read_uint16();

            return true;
        } catch (Error e) {
            // Fim do arquivo ou erro de leitura
            return false;
        }
    }
}

int main() {
    try {
        var file = File.new_for_path("EXEMPLO05.BIN");
        var stream = file.read(null);
        var dis = new DataInputStream(stream);
        dis.byte_order = DataStreamByteOrder.HOST_ENDIAN;

        print("RELATORIO DE REGISTROS DE DADOS PESSOAIS\n\n");

        print("%-41s %9s\n", "Nome", "Idade");
        print("\n");

        Pessoa pessoa = new Pessoa();
        while (pessoa.lerArq(dis)) {
            print("%-41s %9u\n", pessoa.nome, pessoa.idade);
        }

        dis.close(null);

    } catch (Error e) {
        stderr.printf("Erro de acesso ao arquivo: %s\n", e.message);
        return 1;
    }

    pausa();
    return 0;
}
