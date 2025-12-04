// C03EX03

void main() {
	int32 r;
	
    print("Entre o 1o. valor numerico: ");
    int32 a = (int32) int.parse(stdin.read_line());

    print("Entre o 2o. valor numerico: ");
    int32 b = (int32) int.parse(stdin.read_line());

    int32 x = a + b;

    if (x >= 10)
        r = x + 5;
    else
        r = x - 7;

    print("Resultado = %d\n", r);

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
