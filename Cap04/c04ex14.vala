// C04EX14

void main() {
    double n = 0.0;

    while (true) {
        print("Entre um valor numerico: ");
        string entrada = stdin.read_line();

        if (entrada != null && double.try_parse(entrada, out n)) {
            break;
        } else {
            print("Erro: entre apenas valor numerico\n");
        }
    }

    print("Resultado = %.2f\n\n", n + 5.0);
    print("Tecle <Enter> para encerrar... ");
    stdin.read_line();
}
