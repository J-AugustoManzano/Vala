// C06EX14

void main() {
    Gee.ArrayList<string> lista = new Gee.ArrayList<string>();

    // Adição de elementos 
    lista.add("Melancia");
    lista.add("Banana");
    lista.add("Laranja");
    lista.add("Graviola");

    // Exibe a lista inicial
    print("Lista inicial:\n");
    int idx = 0;
    foreach (string item in lista) {
        print("%d: %s\n", idx, item);
        idx++;
    }

    // Remoção de um elemento 
    lista.remove("Banana");

    print("\nLista apos remocao de 'Banana':\n");
    idx = 0;
    foreach (string item in lista) {
        print("%d: %s\n", idx, item);
        idx++;
    }

    // Inserção no início 
    lista.insert(0, "Morango");

    print("\nLista apos inserir 'Morango' no inicio:\n");
    idx = 0;
    foreach (string item in lista) {
        print("%d: %s\n", idx, item);
        idx++;
    }

    // Classificação da lista em ordem alfabética
    lista.sort();

    print("\nLista classificada alfabeticamente:\n");
    idx = 0;
    foreach (string item in lista) {
        print("%d: %s\n", idx, item);
        idx++;
    }
    
    print("\n");
    print("Tecle <Enter> para encerrar... ");
    stdin.read_line();
}
