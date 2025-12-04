// C06EX19

void main() {
    Gee.HashMap<string, int> mapa = new Gee.HashMap<string, int>();

    // Inserção de elementos
    mapa.set("Ameixa", 5);
    mapa.set("Banana", 10);
    mapa.set("Laranja", 7);
    mapa.set("Melancia", 3);

    // Exibe conteúdo do mapa
    print("Mapa inicial:\n");
    foreach (var par in mapa) {
        print("%s => %d\n", par.key, par.value);
    }

    // Acesso a valor por chave
    string chave = "Banana";
    if (mapa.has_key(chave)) {
        print("\nValor da chave '%s' = %d.\n", chave, 
            mapa.get(chave));
    }

    // Remoção de elemento
    mapa.unset("Laranja");
    print("\nMapa apos remover a chave 'Laranja':\n");
    foreach (var par in mapa) {
        print("%s => %d\n", par.key, par.value);
    }

    // Atualização de valor existente
    mapa.set("Ameixa", 8);
    print("\nMapa apos atualizar o valor de 'Ameixa':\n");
    foreach (var par in mapa) {
        print("%s => %d\n", par.key, par.value);
    }

    // --- Operações Adicionais de Mapa ---

    // Acessando as coleções de chaves e valores
    print("Chaves do mapa:\n");
    foreach (string key in mapa.keys) {
        print("- %s\n", key);
    }
    print("Valores do mapa:\n");
    foreach (int value in mapa.values) {
        print("- %d\n", value);
    }

    // Adicionando todos os elementos de outro mapa
    print("\nAdilcao de todos os elementos de outro mapa\n");
    Gee.HashMap<string, int> mapa_adicional = 
        new Gee.HashMap<string, int>();
    mapa_adicional.set("Pera", 6);
    mapa_adicional.set("Uva", 4);
    mapa.set_all(mapa_adicional);
    print("Mapa apos set_all():\n");
    foreach (var par in mapa) {
        print("%s => %d\n", par.key, par.value);
    }

    // Removendo múltiplos elementos de uma vez, iterando
    print("\nRemocao de multiplos elementos com iteracao\n");
    Gee.HashSet<string> chaves_a_remover = new Gee.HashSet<string>();
    chaves_a_remover.add("Banana");
    chaves_a_remover.add("Melancia");
    
    foreach (var chave_remover in chaves_a_remover) {
        mapa.unset(chave_remover);
    }
    
    print("Mapa apos remocao manual:\n");
    foreach (var par in mapa) {
        print("%s => %d\n", par.key, par.value);
    }

    // Verificação de existência de valor (iterando)
    bool valor10 = false;
    foreach (var par in mapa) {
        if (par.value == 10) {
            valor10 = true;
            break;
        }
    }
    if (valor10) {
        print("\nO mapa contem o valor 10.\n");
    } else {
        print("\nO mapa NAO contem o valor 10.\n");
    }

    // Tamanho do mapa e verificação se está vazio
    print("\nO mapa possui %d elementos.\n", mapa.size);

    // Limpeza total
    mapa.clear();
    print("Apos clear(), o mapa possui %d elementos.\n", mapa.size);
    if (mapa.is_empty) {
        print("O mapa agora esta vazio.\n");
    }

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
