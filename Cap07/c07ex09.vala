// C07EX09

class Funcionario {
    protected string nome;
    protected double salario;

    public Funcionario(string nome = "", double salario = 0.0) {
        this.nome = nome;
        this.salario = salario;
    }

    public virtual void calcular_salario() {
        print("Salario de %s: R$ %.2f\n", nome, salario);
    }
}

class Gerente : Funcionario {
    private double bonus;

    public Gerente(string nome, double salario, double bonus) {
        base(nome, salario);
        this.bonus = bonus;
    }

    public override void calcular_salario() {
        double salario_total = salario + bonus;
        print("Salario de %s (Gerente): ", nome);
        print("R$ %.2f\n", salario_total);
    }
}

int main() {
    Funcionario func1 = new Funcionario("Alice", 4000.0);
    Gerente func2 = new Gerente("Bob", 6000.0, 2000.0);

    Funcionario ref1 = func1;
    Funcionario ref2 = func2;

    ref1.calcular_salario(); // Chama versão da classe base
    ref2.calcular_salario(); // Chama versão da classe derivada

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();

    return 0;
}
