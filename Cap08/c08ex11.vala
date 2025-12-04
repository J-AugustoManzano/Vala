// C08EX11

void pausa() {
    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}

class Pessoa {
    public string nome;
    public ushort idade;

    public void escreverArq(DataOutputStream ostream) throws Error {
        var buffer_nome = nome.data;
        uint64 tamanho = (uint64) buffer_nome.length;
        var buffer_completo = new uint8[(size_t)tamanho + 1];

        Memory.copy(buffer_completo, buffer_nome, (size_t)tamanho);
        buffer_completo[tamanho] = 0;

        var bytes_para_escrever = new Bytes(buffer_completo);

        ostream.put_uint64(tamanho + 1);
        ostream.write_bytes(bytes_para_escrever);
        ostream.put_uint16(idade);
    }
}

int main() {
    try {
        var file = File.new_for_path("EXEMPLO05.BIN");
        var stream = file.append_to(FileCreateFlags.NONE, null);
        var ostream = new DataOutputStream(stream);
        ostream.byte_order = DataStreamByteOrder.HOST_ENDIAN;

        print("CADASTRO DE REGISTRO DE DADOS PESSOAIS\n");

        bool continuar = true;
        while (continuar) {
            print("\nEntre nome ...: ");
            string? nome = stdin.read_line();
            if (nome == null) nome = "";
            nome = nome.strip();

            print("Entre idade ..: ");
            string? idade_str = stdin.read_line();
            ushort idade = 0;
            if (idade_str != null && idade_str.strip().length > 0) {
                int idade_int;

                if (int.try_parse(idade_str.strip(), out idade_int)) 
                {
                    idade = (ushort) idade_int;
                } else {
                    print("Idade inalida, usando 0.\n");
                    idade = 0;
                }
            }

            Pessoa pessoa = new Pessoa();
            pessoa.nome = nome;
            pessoa.idade = idade;

            try {
                pessoa.escreverArq(ostream);
            } catch (Error e) {
                stderr.printf("Erro ao gravar: %s\n", e.message);
            }

            print("\nDeseja continuar? [S] Sim ");
            print("[qualquer letra] Nao --> ");
            string? r = stdin.read_line();

            if (r == null || r.strip().up() != "S") {
                continuar = false;
            }
        }

        ostream.close(null);

    } catch (Error e) {
        stderr.printf("Erro de acesso ao arquivo: %s\n", e.message);
        return 1;
    }

    pausa();
    return 0;
}
