// C08EX03

int main() {
    try {
        var file = File.new_for_path("EXEMPLO1.TXT");
        var input_stream = file.read(null);

        uint8[] buffer = new uint8[1];
        ssize_t lidos;

        while ((lidos = input_stream.read(buffer, null)) > 0)
            stdout.putc((char)buffer[0]);

        input_stream.close(null);

        stdout.printf("\nTecle <Enter> para encerrar... ");
        stdin.read_line();
    } catch (Error e) {
        stderr.printf("Erro ao abrir o arquivo: %s\n", e.message);
        return 1;
    }
    return 0;
}
