// C08EX02

int main() {
    try {
        var file = File.new_for_path("EXEMPLO1.TXT");
        var output_stream = 
            file.append_to(FileCreateFlags.NONE, null);
        var writer = new DataOutputStream(output_stream);

        stdout.printf("Informe uma mensagem\n--> ");
        string? mensagem = stdin.read_line();

        if (mensagem != null)
            writer.put_string(mensagem + "\n", null);

        writer.close(null);

        stdout.printf("\nTecle <Enter> para encerrar... ");
        stdin.read_line();
    } catch (Error e) {
        stderr.printf("Erro ao abrir o arquivo: %s\n", e.message);
        return 1;
    }
    return 0;
}
