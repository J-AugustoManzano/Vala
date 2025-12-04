// C07EX07

class Aluno {
    private string nome;
    private int idade;

    // Construtor
    public Aluno(string nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    // Dispose como "destrutor" (desnecessário)
    // public void dispose() {
        // Nenhum recurso especial para liberar
    // }

    public void apresentar() {
        print("Nome: %s tem %d anos\n", nome, idade);
    }
}

void main() {
    // Criar objetos
    var aluno1 = new Aluno("Mario", 20);
    var aluno2 = new Aluno("Carla", 19);

    // Apresentar os detalhes
    aluno1.apresentar();
    aluno2.apresentar();

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
