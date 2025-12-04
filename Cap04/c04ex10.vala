// C04EX10

void main() {
    do {
        print("Entre um valor numerico: ");
        int32 n = (int32) int.parse(stdin.read_line());

        int32 r = n * 3;

        print("Resultado = %d\n\n", r);

        print("Deseja continuar? (S/N): ");
        char resp = stdin.read_line().up()[0];
        if (resp != 'S') break;

        print("\n");
    } while (true);

    print("\n");
    print("Tecle <Enter> para encerrar... ");
    stdin.read_line();
}
