// C08EX10

void pausa() {
    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}

int main() {
    try {
        var file = File.new_for_path("EXEMPL04.BIN");
        var fis = file.read(null);
        var dis = new DataInputStream(fis);

        dis.byte_order = DataStreamByteOrder.HOST_ENDIAN;

        print("Conteudo do arquivo binario:\n\n");

        while (true) {
            uint64 tamanho;

            try {
                tamanho = dis.read_uint64(null);
            } catch (Error e) {
                if (e is IOError) break;
                else throw e;
            }
            
            Bytes bytes = dis.read_bytes((size_t)tamanho, null);

            string mensagem = (string) bytes.get_data();

            print("Mensagem: %s\n", mensagem);
        }

        dis.close(null);

    } catch (Error e) {
        stderr.printf("Erro de acesso ao arquivo: %s\n", e.message);
        return 1;
    }

    pausa();
    return 0;
}
