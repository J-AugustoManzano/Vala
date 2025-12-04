// C01EX05

void main() {
    int valor1, valor2;

    print("Entre o primeiro numero inteiro ..: ");
    valor1 = int.parse(stdin.read_line());

    print("Entre o segundo numero inteiro ...: ");
    valor2 = int.parse(stdin.read_line());

    int soma = valor1 + valor2;

    print("Resultado = %d\n", soma);

    print("\nTecle <Enter> para finalizar... ");
    stdin.read_line();
}
