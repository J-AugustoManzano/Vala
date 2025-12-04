// C07EX08

class Pessoa {
    protected string nome;
    protected int8 idade;

    public Pessoa() {
        nome = "";
        idade = 0;
    }

    public void entrar(string n, int8 i) {
        nome = n;
        idade = i;
    }

    public void exibir() {
        print("Nome ..............: %s\n", nome);
        print("Idade .............: %d\n", idade);
    }
}

class Aluno : Pessoa {
    private string modal;

    public Aluno() {
        base();
        modal = "";
    }

    public new void entrar(string n, int8 i, string m) {
        base.entrar(n, i);
        modal = m;
    }

    public new void exibir() {
        base.exibir();
        print("Ativ. Esportiva ...: %s\n", modal);
    }
}

void main() {
    var aluno = new Aluno();

    string nome = "";
    int idade = 0;
    string modal = "";

    print("Cadastro de Aluno na Academia\n\n");

    print("Nome ..............: ");
    string? nome_temp = stdin.read_line();
    if (nome_temp != null) nome = nome_temp;

    print("Idade .............: ");
    string? idade_temp = stdin.read_line();
    if (idade_temp != null) idade = int.parse(idade_temp);

    print("Ativ. Esportiva ...: ");
    string? modal_temp = stdin.read_line();
    if (modal_temp != null) modal = modal_temp;

    aluno.entrar(nome, (int8) idade, modal);

    print("\nDados do Aluno Cadastrado:\n\n");

    aluno.exibir();

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
