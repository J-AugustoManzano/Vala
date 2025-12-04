// C06EX17

void main() {
    Gee.HashSet<string> conjunto = new Gee.HashSet<string>();

    // Adição de elementos, incluindo um duplicado ("Banana")
    conjunto.add("Melancia");
    conjunto.add("Banana");
    conjunto.add("Laranja");
    conjunto.add("Banana"); // Esta Banana sera ignorada

    // Exibe o conjunto inicial
    print("\nConjunto apos adicoes:\n");
    int idx = 0;
    foreach (string item in conjunto) {
        print("%d: %s\n", idx, item);
        idx++;
    }
    print("Tamanho do conjunto: %d\n", conjunto.size);

    // Verificando a existência de um elemento
    if (conjunto.contains("Laranja")) {
        print("\nO conjunto contem 'Laranja'.\n");
    } else {
        print("\nO conjunto nao contem 'Laranja'.\n");
    }

    // Remoção de um elemento
    conjunto.remove("Banana");

    print("\nConjunto apos remocao de 'Banana':\n");
    idx = 0;
    foreach (string item in conjunto) {
        print("%d: %s\n", idx, item);
        idx++;
    }
    print("Tamanho do conjunto: %d\n", conjunto.size);
    
    // Verificando se o conjunto esta vazio
    if (!conjunto.is_empty) {
        print("\nO conjunto nao esta vazio.\n");
    }

    // Removendo todos os elementos
    conjunto.clear();

    print("\nConjunto apos remocao de todos os elementos:\n");
    idx = 0;
    foreach (string item in conjunto) {
        print("%d: %s\n", idx, item);
        idx++;
    }
    print("Tamanho do conjunto: %d\n", conjunto.size);

    if (conjunto.is_empty) {
        print("O conjunto esta vazio.\n");
    }

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
