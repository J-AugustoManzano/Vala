// C02EX06

void main() {
    print("Entre o primeiro numero inteiro ..: ");
    int32 valor1 = (int32) int.parse(stdin.read_line());

    print("Entre o segundo numero inteiro ...: ");
    int32 valor2 = (int32) int.parse(stdin.read_line());

    int32 soma = valor1 + valor2;

    print("Resultado = %d\n", soma);

    print("\nTecle <Enter> para finalizar... ");
    stdin.read_line();
}
