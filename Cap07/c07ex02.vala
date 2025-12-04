// C07EX02

class Aluno {
    private string nome;
    private double[] nota;
    private double media;

    public Aluno() {
        nota = new double[4];
    }

    public void poe_nome(string nome) {
        this.nome = nome;
    }

    public string pega_nome() {
        return nome;
    }

    public void poe_nota(string entrada, int pos) {
        nota[pos] = double.parse(entrada);
    }

    public double pega_nota(int pos) {
        return nota[pos];
    }

    public void poe_media() {
        media = 0;
        for (int8 i = 0; i < nota.length; i++) {
            media += nota[i];
        }
        media /= nota.length;
    }

    public double pega_media() {
        return media;
    }
}

void main() {
    var aluno = new Aluno();

    print("Cadastro de aluno\n\n");

    print("Informe o nome.....: ");
    string? nome_temp = stdin.read_line();
    if (nome_temp != null) {
        aluno.poe_nome(nome_temp);
    }
    print("\n");

    print("Informe as notas:\n\n");
    for (int8 i = 0; i < 4; i++) {
        print("%da. nota...........: ", i + 1);
        string? entrada = stdin.read_line();
        if (entrada != null) {
            aluno.poe_nota(entrada, i);
        }
    }
    print("\n");

    aluno.poe_media();

    print("\nRelatorio\n\n");
    print("Nome..........: %s\n\n", aluno.pega_nome());
    for (int8 i = 0; i < 4; i++) {
        print("%da. nota......: %5.2f\n", i + 1, aluno.pega_nota(i));
    }
    print("\n");

    print("Media.........: %5.2f\n", aluno.pega_media());

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
