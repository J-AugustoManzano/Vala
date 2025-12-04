// C06EX03

struct Aluno {
    string nome;
    char turma;
    int sala;
    float[] notas;
}

void main() {
    int i, j;
    Aluno[] aluno = new Aluno[8];

    for (i = 0; i <= 7; i++) {
        aluno[i].notas = new float[4];
    }

    print("Escola de Computacao XPTO\n");
    print("Cadastro Escolar de Aluno\n\n");

    for (i = 0; i <= 7; i++) {
        print("Aluno: %d\n\n", i + 1);

        print("Nome ..............: ");
        aluno[i].nome = stdin.read_line().strip();

        print("Turma .............: ");
        aluno[i].turma = stdin.read_line()[0];

        print("Sala ..............: ");
        aluno[i].sala = int.parse(stdin.read_line());

        print("\n");

        for (j = 0; j <= 3; j++) {
            print("Entre a %da. nota ..: ", j + 1);
            aluno[i].notas[j] = 
                float.parse(stdin.read_line());
        }

        print("\n");
    }

    print("Escola de Computacao XPTO\n");
    print("Cadastro Escolar de Aluno\n\n");
    print("DADOS DOS ALUNOS\n");

    print("Aluno ");
    print("Nome                           ");
    print("Sala ");
    print("Turma ");
    print("Nota1 ");
    print("Nota2 ");
    print("Nota3 ");
    print("Nota4\n");

    print("----- ");
    print("------------------------------ ");
    print("---- ");
    print("----- ");
    print("----- ");
    print("----- ");
    print("----- ");
    print("-----\n");

    for (i = 0; i <= 7; i++) {
        print("%5d ", i + 1);
        print("%-30s ", aluno[i].nome);
        print("%4d ", aluno[i].sala);
        print("%5c ", aluno[i].turma);
        for (j = 0; j <= 3; j++) {
            print("%5.1f ", aluno[i].notas[j]);
        }
        print("\n");
    }

    print("\n");
    print("Tecle <Enter> para encerrar... ");
    stdin.read_line();
}
