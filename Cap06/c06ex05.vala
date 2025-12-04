// C06EX05

int main() {
    // Definindo uma matriz interna 1D
    int[] numeros = { 1, 2, 3, 4, 5 };

    print("Exibindo os números usando para cada:\n");

    // Laço para cada: mostra dados
    foreach (int n in numeros) {
        print("%d ", n);
    }

    print("\n");

    // Cálculo do somatório
    int soma = 0;
    foreach (int n in numeros) {
        soma += n;
    }
    print("Soma dos números: %d\n\n", soma);

    stdout.printf("Tecle <Enter> para encerrar... ");
    stdin.read_line();

    return 0;
}
