// C06EX18

// Funcao para exibir o conteudo de um conjunto
private void exibir(string nome, Gee.Set<int> conjunto) {
    stdout.printf("%s: {", nome);
    int count = 0;
    foreach (var item in conjunto) {
        stdout.printf("%d", item);
        if (count < conjunto.size - 1) {
            stdout.printf(", ");
        }
        count++;
    }
    stdout.printf("}\n");
}

// Funcao para verificar se um conjunto e subconjunto de outro
private bool subset(Gee.Set<int> conjuntoA, Gee.Set<int> conjuntoB) {
    foreach (var item in conjuntoA) {
        if (!conjuntoB.contains(item)) {
            return false;
        }
    }
    return true;
}

// Funcao para verificar se um conjunto e superconjunto de outro
private bool superset(Gee.Set<int> conjuntoA, Gee.Set<int> conjuntoB) 
{
    return subset(conjuntoB, conjuntoA);
}

void main() {
    Gee.HashSet<int> conjuntoA = new Gee.HashSet<int>();
    conjuntoA.add(1);
    conjuntoA.add(2);
    conjuntoA.add(3);
    conjuntoA.add(4);
    conjuntoA.add(5);

    Gee.HashSet<int> conjuntoB = new Gee.HashSet<int>();
    conjuntoB.add(4);
    conjuntoB.add(5);
    conjuntoB.add(6);
    conjuntoB.add(7);
    conjuntoB.add(8);

    Gee.HashSet<int> conjuntoC = new Gee.HashSet<int>();
    conjuntoC.add(1);
    conjuntoC.add(2);

    exibir("Conjunto A", conjuntoA);
    exibir("Conjunto B", conjuntoB);
    exibir("Conjunto C", conjuntoC);
    print("\n");

    // --- Operacoes de Teoria de Conjuntos ---
    
    // Uniao: Cria conjunto - todos os elementos de A e B.
    Gee.HashSet<int> uniao = new Gee.HashSet<int> ();
    uniao.add_all(conjuntoA);
    uniao.add_all(conjuntoB);
    exibir("Operacao de Uniao ................", uniao);

    // Interseccao: Cria conjunto - elementos comuns a A e B.
    Gee.HashSet<int> interseccao = new Gee.HashSet<int> ();
    interseccao.add_all(conjuntoA);
    interseccao.retain_all(conjuntoB);
    exibir("Operacao de Interseccao ..........", interseccao);

    // Diferenca: Cria conjunto - elementos em A que nao estao em B.
    Gee.HashSet<int> diferenca = new Gee.HashSet<int> ();
    diferenca.add_all(conjuntoA);
    diferenca.remove_all(conjuntoB);
    exibir("Operacao de Diferenca ............", diferenca);

    // Diferenca Simetrica
    Gee.HashSet<int> diferenca_simetrica = new Gee.HashSet<int> ();
    diferenca_simetrica.add_all(conjuntoA);
    diferenca_simetrica.remove_all(interseccao);
    diferenca_simetrica.add_all(conjuntoB);
    diferenca_simetrica.remove_all(interseccao);
    exibir("Operacao de Diferenca Simetrica ..", 
        diferenca_simetrica);
    print("\n");

    // --- Testes de Relacionamento entre Conjuntos ---

    // Teste de Subconjunto: Verifica se C está contido em A.
    if (subset(conjuntoC, conjuntoA)) {
        print("C subconjunto de A.\n");
    }

    // Teste de Superconjunto: Verifica se A contem elementos de C.
    if (superset(conjuntoA, conjuntoC)) {
        print("A superconjunto de C.\n");
    }
    if (conjuntoA.contains_all(conjuntoC)) {
        print("A contem todos os elementos de C.\n");
    }

    // --- Manipulacao de Conjuntos (altera o conjunto original) ---

    // add_all: Adiciona todos os elementos de C em A.
    print("\nAdiciona todos os elementos de C em A - add_all():\n");
    conjuntoA.add_all(conjuntoC);
    exibir("Novo Conjunto A", conjuntoA);

    // remove_all: Remove de A os elementos que estao em B.
    print("\nRemove elementos de B que estao em A - ");
    print("remove_all():\n");
    conjuntoA.remove_all(conjuntoB);
    exibir("Conjunto A apos remove_all(B)", conjuntoA);

    // retain_all: Apos as operacoes: reter os elementos de B em A.
    print("\nRetem os elementos de B em A - retain_all():\n");
    // Primeiro, reinicializar o conjunto A para o teste
    conjuntoA.clear();
    conjuntoA.add(1); 
    conjuntoA.add(2);
    conjuntoA.add(3); 
    conjuntoA.add(4); 
    conjuntoA.add(5);
    exibir("Conjunto A (reinicializado)", conjuntoA);
    
    conjuntoA.retain_all(conjuntoB);
    exibir("Conjunto A apos retain_all(B)", conjuntoA);

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
