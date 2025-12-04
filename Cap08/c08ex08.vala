// C08EX08

void pausa() {
    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}

int main() {
    try {
        int32 valor = 0;
        uint64 pos;
        char resp = 'S';
        
        uint64 tamanho_arquivo;
        size_t tamanho_registro;
        uint64 nr_regs;

        var file = File.new_for_path("EXEMPLO3.BIN");
        var stream = file.open_readwrite(null);

        var info = file.query_info(
            "standard::size", FileQueryInfoFlags.NONE, null);
        tamanho_arquivo = info.get_size();

        tamanho_registro = sizeof(int32);
        if (tamanho_registro == 0)
            nr_regs = 0;
        else
            nr_regs = tamanho_arquivo / tamanho_registro;

        print("PESQUISA DIRETA E ESCRITA DE VALORES\n\n");
        
        if (nr_regs == 0) {
            print("O arquivo esta vazio.\n");
        } else {
            print("O arquivo possui %lu ".printf((ulong) nr_regs));
            if (nr_regs == 1) {
                print("registro.\n");
            } else {
                print("registros.\n");
            }
        }

        do {
            print("\nEntre a posicao a ser pesquisada: ");
            string? linha_posicao = stdin.read_line();
            if (linha_posicao != null)
                pos = uint64.parse(linha_posicao);
            else
                pos = 0;
            print("\n");
            
            if (pos >= 1 && pos <= nr_regs) {
                int64 offset = (int64)((pos - 1) * tamanho_registro);
                uint8[] buffer = new uint8[tamanho_registro];
                
                // Leitura
                stream.seek(offset, SeekType.SET, null);
                var istream = stream.get_input_stream();
                istream.read(buffer, null);
                Memory.copy(&valor, buffer, tamanho_registro);

                print("Valor %d na posicao %lu\n", 
                    valor, (ulong) pos);
                
                // Atualização
                print("\nEntre o novo valor: ");
                string? nova_linha_valor = stdin.read_line();
                if (nova_linha_valor != null)
                    valor = int.parse(nova_linha_valor);
                else
                    valor = 0;

                Memory.copy(buffer, &valor, tamanho_registro);
                stream.seek(offset, SeekType.SET, null);
                var ostream = stream.get_output_stream();
                ostream.write(buffer, null);

                print("\nValor atualizado %d na posicao %lu\n", 
                    valor, (ulong) pos);

            } else {
                stderr.printf("Posicao informada - invalida.\n");
            }

            print("\nDeseja continuar? \n");
            print("[S] Sim \n[qualquer letra] Nao\n\n--> ");
            
            string? resp_str = stdin.read_line();
            
            if (resp_str != null && resp_str.length > 0)
                resp = resp_str[0];
            else
                resp = 'N';
            
        } while (resp == 'S' || resp == 's');

        stream.close(null);

    } catch (Error e) {
        stderr.printf("Erro de acesso ao arquivo: %s\n", e.message);
        return 1;
    }

    pausa();
    return 0;
}
