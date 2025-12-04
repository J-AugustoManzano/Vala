// C04EX05

void main() {
    int32 i = 1;
    do {
        print("Entre um valor numerico: ");
        int32 n = (int32) int.parse(stdin.read_line());

        int32 r = n * 3;

        print("Resultado = %d\n\n", r);

        i++;
    } while (!(i > 5));

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
