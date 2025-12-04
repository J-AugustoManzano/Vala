// C08EX04

int main() {
    try {
        float[] num = new float[5];
        uint8[] buffer = new uint8[4];
        
        var file = File.new_for_path("EXEMPLO2.BIN");
        var output_stream = 
            file.replace(null, false, FileCreateFlags.NONE, null);

        print("Entre 5 valores numericos:\n\n");
        for (int i = 0; i < num.length; i++) {
            print("Informe valor %d: ", i + 1);
            string? linha = stdin.read_line();
            if (linha != null) {
                num[i] = float.parse(linha);
            } else {
                num[i] = 0.0f;
            }
            Memory.copy(buffer, &num[i], 4);
            output_stream.write(buffer, null);
        }
        output_stream.close(null);

        print("\nTecle <Enter> para encerrar... ");
        stdin.read_line();
    } catch (Error e) {
        stderr.printf("Erro ao abrir o arquivo: %s\n", e.message);
        return 1;
    }

    return 0;
}
