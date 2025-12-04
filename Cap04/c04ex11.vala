// C04EX11

void main() {
    int32 i, n, r;

    for (i = 1; i <= 5; i++) {
        print("Entre um valor numerico: ");
        n = (int32) int.parse(stdin.read_line());

        r = n * 3;

        print("Resultado = %d\n\n", r);
    }

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
