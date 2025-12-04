// C08EX05

int main() {
    try {
        float[] num = new float[5];
        size_t tamanho_esperado = num.length * sizeof(float);
        uint8[] conteudo = new uint8[tamanho_esperado];

        var file = File.new_for_path("EXEMPLO2.BIN");
        var input_stream = file.read(null);
        
        ssize_t bytes_lidos = input_stream.read(conteudo, null);
        
        if (bytes_lidos != tamanho_esperado) {
            stderr.printf("Erro: arquivo corrompido.\n");
            input_stream.close(null);
            return 1;
        }
        
        for (int i = 0; i < num.length; i++) {
            Memory.copy(&num[i], &conteudo[i * 
                sizeof(float)], sizeof(float));
        }

        print("Apresentacao de 5 valores numericos:\n\n");
        
        for (int i = 0; i < num.length; i++) {
            print("Valor cadastrado %d: %f\n", i + 1, num[i]);
        }

        input_stream.close(null);

        print("\nTecle <Enter> para encerrar... ");
        stdin.read_line();
    } catch (Error e) {
        stderr.printf("Erro de acesso ao arquivo: %s\n", e.message);
        return 1;
    }

    return 0;
}
