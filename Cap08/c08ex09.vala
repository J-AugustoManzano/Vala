// C08EX09

void pausa() {
    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}

int main() {
    try {
        string mensagem;
        
        var file = File.new_for_path("EXEMPL04.BIN");
        var stream = file.append_to(FileCreateFlags.NONE, null);
        
        var ostream = new DataOutputStream(stream);
        ostream.byte_order = DataStreamByteOrder.HOST_ENDIAN;

        print("Informe uma mensagem\n--> ");
        string? linha = stdin.read_line();
        if (linha != null) {
            mensagem = linha;
        } else {
            mensagem = "";
        }

        var buffer_string = mensagem.data;
        var tamanho_mensagem = (uint64) buffer_string.length;
        
        var buffer_completo = 
            new uint8[(size_t) tamanho_mensagem + 1];
        
        Memory.copy(buffer_completo, buffer_string, 
            (size_t) tamanho_mensagem);
        
        buffer_completo[tamanho_mensagem] = 0;
        
        var bytes_para_escrever = new Bytes(buffer_completo);

        ostream.put_uint64(tamanho_mensagem + 1, null);
        
        ostream.write_bytes(bytes_para_escrever, null);

        ostream.close(null);

    } catch (Error e) {
        stderr.printf("Erro de acesso ao arquivo: %s\n", e.message);
        return 1;
    }

    pausa();
    return 0;
}
