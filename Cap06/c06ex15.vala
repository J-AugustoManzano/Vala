// C06EX15

// Compara "b" com "a" para obter a ordem descendente
private int string_compare_desc(string a, string b) {
    if (b > a) {
        return 1;
    } else if (b < a) {
        return -1;
    }
    return 0;
}

void main() {
    Gee.ArrayList<string> lista = new Gee.ArrayList<string>();

    // Inserção de elementos
    lista.add("Ameixa"); 
    lista.add("Melancia");
    lista.add("Banana");
    lista.add("Laranja");
    lista.add("Graviola");
    lista.add("Banana"); // Duplicidade de elemento

    // Exibe a lista inicial
    print("Lista inicial:\n");
    int idx = 0;
    foreach (string item in lista) {
        print("%d: %s\n", idx, item);
        idx++;
    }
    print("\n");

    // Localização de elemento
    if (lista.contains("Laranja")) {
        print("A lista contem 'Laranja'.\n");
    } else {
        print("A lista nao contem 'Laranja'.\n");
    }

    // Remoção de mais de um elemento igual
    // Itera de trás para frente para remover todas as "Bananas"
    for (int i = lista.size - 1; i >= 0; i--) {
        if (lista.get(i) == "Banana") {
            lista.remove_at(i);
        }
    }
    
    print("\nLista apos remocao de todas as 'Banana':\n");
    idx = 0;
    foreach (string item in lista) {
        print("%d: %s\n", idx, item);
        idx++;
    }

    // Classificação em ordem decrescente
    lista.sort(string_compare_desc);

    print("\nLista classificada de Z a A:\n");
    idx = 0;
    foreach (string item in lista) {
        print("%d: %s\n", idx, item);
        idx++;
    }

    // Exibe o status da lista
    print("\nNumero de elementos na lista: %d. ", lista.size);

    if (!lista.is_empty) {
        print("A lista nao esta vazia.\n");
    }

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
