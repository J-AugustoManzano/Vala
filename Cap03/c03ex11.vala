// C03EX11	

void main() {
    print("Entre um numero inteiro: ");
    int64 n = int64.parse(stdin.read_line());

    int64 r4 = n % 4;
    int64 r5 = n % 5;

    if (r4 == 0 && r5 == 0)
        print("Resultado = %s\n", n.to_string());
    else
        print("Valor nao e divisivel por 4 e 5\n");

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}

