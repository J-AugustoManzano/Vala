// C02EX01

void main() {
    // Operadores binários
    print("Soma: %d\n", 5 + 3);
    print("Subtracao: %d\n", 10 - 4);
    print("Multiplicacao: %d\n", 2 * 6);
    
    // Divisão com ponto flutuante
    print("Divisao real: %.2f\n", 10.0 / 3.0);
    
    // Divisão inteira (Vala trunca o resultado)
    print("Divisao inteira: %d\n", 10 / 3);
    
    // Resto da divisão (módulo)
    print("Resto da divisao: %d\n", 10 % 3);
    
    // Operadores unários
    print("Sinal positivo: %d\n", +5);
    print("Sinal negativo: %d\n", -8);
    
    print("\n");
    print("Tecle <Enter> para finalizar... ");
    stdin.read_line();
}
