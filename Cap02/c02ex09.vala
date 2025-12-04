// C02EX09

void main() {
    /*
        Programa exemplo para operações de duas entradas
        com cálculo de adição e apresentação do resultado.
    */

    // Declaração das variáveis (estilo antigo)
    int32 a, b, x;

    // Exibe o título do programa
    print("ADICAO DE NUMEROS\n\n");

    // Entrada de dados
    print("Entre o 1o. valor numerico: ");
    a = (int32) int.parse(stdin.read_line());

    print("Entre o 2o. valor numerico: ");
    b = (int32) int.parse(stdin.read_line());

    // Processamento de dados
    x = a + b;  // Cálculo da adição

    // Saída de dados
    print("Resultado = %d\n", x);

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();  // Pausa para o usuário
}
