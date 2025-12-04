// C04EX09

void main() {
	int32 i = 1;
    do {
        print("Entre um valor numerico: ");
        int32 n = (int32) int.parse(stdin.read_line());

        int32 r = n * 3;

        print("Resultado = %d\n", r);

        if (i > 4) break;
        i++;

        print("\n");
    } while (true);

    print("\n");
    print("Tecle <Enter> para encerrar... ");
    stdin.read_line();
}
