// C07EX11

class Aluno {
    private string nome;
    private double[] notas;
    private double media;

    public Aluno(int num_notas) {
        notas = new double[num_notas];
    }

    public void poe_nome(string n) {
        nome = n;
    }

    public string pega_nome() {
        return nome;
    }

    public void poe_nota(double nota, int pos) {
        if (pos >= 0 && pos < notas.length) {
            notas[pos] = nota;
        }
    }

    public double pega_nota(int pos) {
        if (pos >= 0 && pos < notas.length) {
            return notas[pos];
        }
        return 0.0;
    }

    public void poe_media() {
        double soma = 0.0;
        for (int i = 0; i < notas.length; i++) {
            soma += notas[i];
        }
        media = soma / notas.length;
    }

    public double pega_media() {
        return media;
    }
}

int main() {
    int8 num_alunos;
    int8 num_notas = 4;
    double media_gp = 0.0;

    print("Quantos alunos: ");
    string? linha = stdin.read_line();
    if (linha == null) return 1;

    num_alunos = (int8) int.parse(linha.strip());

    Aluno[] alunos = new Aluno[(int)num_alunos];

    for (int8 i = 0; i < num_alunos; i++) {
        print("\nCadastro de aluno %d\n\n", (int)i + 1);
        print("Informe o nome.....: ");
        string? nome = stdin.read_line();
        if (nome == null) continue;
        nome = nome.strip();

        Aluno aluno = new Aluno(num_notas);
        aluno.poe_nome(nome);

        print("\nInforme as notas:\n\n");
        for (int8 j = 0; j < num_notas; j++) {
            print("%da. nota..........: ", (int)j + 1);
            string? nota_str = stdin.read_line();
            if (nota_str == null) continue;
            double nota = double.parse(nota_str.strip());
            aluno.poe_nota(nota, (int)j);
        }

        aluno.poe_media();
        alunos[(int)i] = aluno;
    }

    print("\nRelatorio Geral\n\n");
    print("%-41s", "Aluno");
    for (int8 j = 0; j < num_notas; j++)
        print("%7s", "Nota" + ((int)j + 1).to_string());
    print("%7s\n\n", "Media");

    for (int8 i = 0; i < num_alunos; i++) {
        print("%-41s", alunos[(int)i].pega_nome());
        for (int8 j = 0; j < num_notas; j++)
            print("%7.2f", alunos[(int)i].pega_nota((int)j));
        print("%7.2f\n", alunos[(int)i].pega_media());
        media_gp += alunos[(int)i].pega_media();
    }

    media_gp /= (int)num_alunos;

    print("\n%70s%6.2f\n\n", "Media Geral = ", media_gp);
    print("Tecle <Enter> para encerrar... ");
    stdin.read_line();

    return 0;
}
