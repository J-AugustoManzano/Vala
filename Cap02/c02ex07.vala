// C02EX07

void main() {
    print("Entre salario atual ...............: ");
    double salario = double.parse(stdin.read_line());

    print("Entre reajuste - ex: 10 para 10%% ..: ");
    double reajuste = double.parse(stdin.read_line());

    double novo_salario = salario * (1 + reajuste / 100);

    print("Novo salario= %.2f\n", novo_salario);

    print("\nTecle <Enter> para finalizar... ");
    stdin.read_line();
}
