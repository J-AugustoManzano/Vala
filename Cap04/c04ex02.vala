// C04EX02

void main() {
    char resp = 'S';
    while (resp == 'S') {
        print("Entre um valor numerico: ");
        int32 n = (int32) int.parse(stdin.read_line());

        int32 r = n * 3;

        print("Resultado = %d\n\n", r);

        print("Deseja continuar? (S/N): ");
        resp = stdin.read_line().up()[0];

        print("\n");
    }

    print("\n");
    print("Tecle <Enter> para encerrar... ");
    stdin.read_line();
}
