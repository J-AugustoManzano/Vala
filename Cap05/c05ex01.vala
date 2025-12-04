// C05EX01

void rotsoma() {
    float a1, b1, r1;
    print("\n");
    print("Rotina de Adicao\n\n");
    print("Entre o 1o. valor: ");
    a1 = float.parse(stdin.read_line());
    print("Entre o 2o. valor: ");
    b1 = float.parse(stdin.read_line());
    r1 = a1 + b1;
    print("\nO resultado da operacao equivale a: %.2f\n\n", r1);
}

void rotsubtracao() {
    float a2, b2, r2;
    print("\n");
    print("Rotina de Subtracao\n\n");
    print("Entre o 1o. valor: ");
    a2 = float.parse(stdin.read_line());
    print("Entre o 2o. valor: ");
    b2 = float.parse(stdin.read_line());
    r2 = a2 - b2;
    print("\nO resultado da operacao equivale a: %.2f\n\n", r2);
}

void rotmultiplicacao() {
    float a3, b3, r3;
    print("\n");
    print("Rotina de Multiplicacao\n\n");
    print("Entre o 1o. valor: ");
    a3 = float.parse(stdin.read_line());
    print("Entre o 2o. valor: ");
    b3 = float.parse(stdin.read_line());
    r3 = a3 * b3;
    print("\nO resultado da operacao equivale a: %.2f\n\n", r3);
}

void rotdivisao() {
    float a4, b4, r4;
    print("\n");
    print("Rotina de Divisao\n\n");
    print("Entre o 1o. valor: ");
    a4 = float.parse(stdin.read_line());
    print("Entre o 2o. valor: ");
    b4 = float.parse(stdin.read_line());
    if (b4 == 0)
        print("\nO resultado da operacao equivale a: ERRO\n\n");
    else {
        r4 = a4 / b4;
        print("\nO resultado da operacao equivale a: %.2f\n\n", r4);
    }
}

void main() {
    int opcao = 0;
    while (opcao != 5) {
        print("CALCULADORA - V1\n\n");
        print("[1] - Adicao\n");
        print("[2] - Subtracao\n");
        print("[3] - Multiplicacao\n");
        print("[4] - Divisao\n");
        print("[5] - Fim de Programa\n\n");
        print("Escolha uma opcao: ");
        opcao = int.parse(stdin.read_line());
        if (opcao != 5) {
            switch (opcao) {
                case 1: rotsoma();          break;
                case 2: rotsubtracao();     break;
                case 3: rotmultiplicacao(); break;
                case 4: rotdivisao();       break;
                default:
                    print("\nOpcao invalida - Tente novamente ");
                    print("\n\n");
                    break;
            }
        }
    }
}
