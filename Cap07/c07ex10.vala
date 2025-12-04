// C07EX10

public delegate string FuncDesc<T>(T item);

class Aluno {
    public string nome;
    public int idade;

    public Aluno(string n, int i) {
        nome = n;
        idade = i;
    }

    public string descricao() {
        return "%s (%d anos)".printf(nome, idade);
    }
}

class Instrutor {
    public string nome;
    public string modalidade;

    public Instrutor(string n, string m) {
        nome = n;
        modalidade = m;
    }

    public string descricao() {
        return "%s - Instrutor de %s".printf(nome, modalidade);
    }
}

class Lista<T> {
    private T[] itens = {};

    public void adicionar(T item) {
        itens += item;
    }

    public void mostrar(FuncDesc<T> func_desc) {
        foreach (var item in itens) {
            print("%s\n", func_desc(item));
        }
    }
}

// Funções auxiliares para delegate
string aluno_desc(Aluno a) {
    return a.descricao();
}

string instrutor_desc(Instrutor i) {
    return i.descricao();
}

void main() {
    Lista<Aluno> alunos = new Lista<Aluno>();
    alunos.adicionar(new Aluno("Alice", 20));
    alunos.adicionar(new Aluno("Bob", 22));

    Lista<Instrutor> instrutores = new Lista<Instrutor>();
    instrutores.adicionar(new Instrutor("Carlos", "Yoga"));
    instrutores.adicionar(new Instrutor("Daniela", "Musculação"));

    print("=== Alunos ===\n");
    alunos.mostrar(aluno_desc);

    print("\n=== Instrutores ===\n");
    instrutores.mostrar(instrutor_desc);

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
