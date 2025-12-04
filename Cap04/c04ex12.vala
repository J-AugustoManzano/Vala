// C04EX12

void main() {
    int16 numero = 1;

    while (numero <= 10) {
        if (numero % 5 == 0) {
            print("Primeiro multiplo de 5 encontrado: %d\n", numero);
            // interrompe o laço após encontrar o 1o. múltiplo de 5
            break; 
        }
        numero++;
    }

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
