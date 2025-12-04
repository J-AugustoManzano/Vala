// C08EX06

void pausa() {
    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}

int main() {
    try {
        int32 valor;
        string? resp_str;
        char resp = 'S';
        uint8[] buffer = new uint8[4];

        var file = File.new_for_path("EXEMPLO3.BIN");
        var output_stream = 
            file.append_to(FileCreateFlags.NONE, null);

        print("CADASTRO SEQUENCIAL DE VALORES\n");

        do {
            print("\nEntre um valor: ");
            string? linha = stdin.read_line();
            if (linha != null) {
                valor = int.parse(linha);
                Memory.copy(buffer, &valor, 4);
                output_stream.write(buffer, null);
            }

            print("\nDeseja continuar? ");
            print("[S] Sim \n[qualquer letra] Nao\n\n--> ");
            
            resp_str = stdin.read_line();
            
            if (resp_str != null && resp_str.length > 0) {
                resp = resp_str[0];
            } else {
                resp = 'N';
            }
            
        } while (resp == 'S' || resp == 's');
        
        output_stream.close(null);

    } catch (Error e) {
        stderr.printf("Erro de acesso ao arquivo: %s\n", e.message);
        return 1;
    }

    pausa();
    return 0;
}
