// C04EX13

void main() {
    int16 numero = 1;

    while (numero <= 10) {
        if (numero % 2 != 0) {
            ++numero;
            continue; // pula os números ímpares
        }
        print("Numero par: %2d\n", numero);
        numero++;
    }

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
