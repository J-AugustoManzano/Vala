// C08EX01

int main() {
    try {
        var file = File.new_for_path("EXEMPLO1.TXT");
        var output_stream = 
            file.replace(null, false, FileCreateFlags.NONE, null);
        output_stream.close(null);

        stdout.printf("Arquivo criado com sucesso.\n");
    } catch (Error e) {
        stderr.printf("Erro ao criar o arquivo: %s\n", e.message);
        return 1;
    }
    return 0;
}
