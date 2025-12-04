// C03EX06

void main() {
    print("Entre o 1o. valor numerico: ");
    double a = double.parse(stdin.read_line());

    print("Entre o 2o. valor numerico: ");
    double b = double.parse(stdin.read_line());

    print("\n");
    print("Escolha uma opcao de menu:\n");
    print("\n");
    print("[1] - Adicao\n");
    print("[2] - Subtracao\n");
    print("[3] - Multiplicacao\n");
    print("[4] - Divisao\n");
    print("\n");

    print("==> ");
    int32 opcao = (int32) int.parse(stdin.read_line());
    print("\n");

    switch (opcao) {
        case 1:
            print("Calculo de adicao\n");
            print("Resultado: %.2f\n", a + b);
            break;
        case 2:
            print("Calculo de subtracao\n");
            print("Resultado: %.2f\n", a - b);
            break;
        case 3:
            print("Calculo de multiplicacao\n");
            print("Resultado: %.2f\n", a * b);
            break;
        case 4:
            print("Calculo de divisao\n");
            if (b == 0)
                print("Resultado: ERRO\n");
            else
                print("Resultado: %.2f\n", a / b);
            break;
        default:
            print("Entrada invalida\n");
            print("Tente novamente em outro momento\n");
            break;
    }

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
