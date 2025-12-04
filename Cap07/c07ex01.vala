// C07EX01

class Aluno {
    public string nome;
    public double[] nota;
    public double media;

    public Aluno() {
        nota = new double[4];
    }

	public double poe_media() {
	    double soma = 0.0;
	    for (int8 i = 0; i < nota.length; i++) {
	        soma += nota[i];
	    }
	    media = soma / nota.length;
	    return media;
	}
}

void main() {
    var aluno = new Aluno();

    print("Cadastro de aluno\n\n");
    print("Informe o nome.....: ");
    aluno.nome = stdin.read_line();
    print("\n");

    print("Informe as notas:\n\n");
    for (int8 i = 0; i < aluno.nota.length; i++) {
        print("%2da. nota..........: ", i + 1);
        string? entrada = stdin.read_line();
        if (entrada != null) {
            aluno.nota[i] = double.parse(entrada);
        }
    }
    print("\n");

    aluno.poe_media();

    print("\nRelatorio\n\n");
    print("Nome..........: %s\n\n", aluno.nome);
    for (int8 i = 0; i < aluno.nota.length; i++) {
        print("%2da. nota.....: %5.2f\n", i + 1, aluno.nota[i]);
    }
    print("\n");
    print("Media.........: %5.2f\n", aluno.media);

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
