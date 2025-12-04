// C06EX01

void main() {
    double[] md = new double[8];
    double soma = 0.0;
    double media;

    for (int i = 0; i < 8; i++) {
        print("Entre a media do aluno %d: ", i + 1);
        md[i] = double.parse(stdin.read_line());
        soma += md[i];
    }

    media = soma / 8.0;

    print("\n");
    print("Media geral: %.2f\n", media);

    print("\n");
    print("Tecle <Enter> para encerrar... ");
    stdin.read_line();
}
