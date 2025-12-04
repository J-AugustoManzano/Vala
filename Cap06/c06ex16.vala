// C06EX16

// Função que encontra todas as posições de um elemento na lista
private Gee.ArrayList<int> busca_posicoes(
    Gee.ArrayList<string> lista, string elemento) {
    Gee.ArrayList<int> posicoes = new Gee.ArrayList<int>();
    for (int i = 0; i < lista.size; i++) {
        if (lista.get(i) == elemento) {
            posicoes.add(i);
        }
    }
    return posicoes;
}

void main() {
    Gee.ArrayList<string> lista = new Gee.ArrayList<string>();

    // Inserção de elementos
    lista.add("Melancia");
    lista.add("Banana");
    lista.add("Laranja");
    lista.add("Graviola");
    lista.add("Banana"); 

    print("Lista inicial:\n");
    for (int i = 0; i < lista.size; i++) {
        print("%d: %s\n", i, lista.get(i));
    }
    
    // Inserindo "Abacaxi" no índice 1
    lista.insert(1, "Abacaxi");
    
    print("\nLista apos inserir 'Abacaxi' no indice 1:\n");
    for (int i = 0; i < lista.size; i++) {
        print("%d: %s\n", i, lista.get(i));
    }
    
    // Substituindo o elemento no índice 3 por "Morango"
    lista.set(3, "Morango");
    
    print("\nLista apos substituir 'Laranja' por 'Morango':\n");
    for (int i = 0; i < lista.size; i++) {
        print("%d: %s\n", i, lista.get(i));
    }
    
    // Buscando todas as posições de "Banana"
    var posicoes_banana = busca_posicoes(lista, "Banana");
    print("\n'Banana' encontrada nas posicoes:\n");
    for (int i = 0; i < posicoes_banana.size; i++) {
        print("%d\n", posicoes_banana.get(i));
    }
    
    // Criando uma nova lista com uma "fatia" da lista original
    var sublista = lista.slice(1, 4);
    
    print("\nSub-lista (a partir do indice 1, com 3 elementos):\n");
    for (int i = 0; i < sublista.size; i++) {
        print("%d: %s\n", i, sublista.get(i));
    }
    
    // Remove todos os elementos da lista
    lista.clear();
    
    print("\nLista apos remocao total:\n");
    for (int i = 0; i < lista.size; i++) {
        print("%d: %s\n", i, lista.get(i));
    }

    print("\nNumero final de elementos na lista: %d\n", lista.size);
    
    if (!lista.is_empty) {
        print("A lista nao esta vazia.\n");
    }
    
    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
