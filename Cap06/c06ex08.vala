// C06EX08

enum Meses {
    JANEIRO = 1,
    FEVEREIRO,
    MARCO,
    ABRIL,
    MAIO,
    JUNHO,
    JULHO,
    AGOSTO,
    SETEMBRO,
    OUTUBRO,
    NOVEMBRO,
    DEZEMBRO
}

int main() {
    Meses mes;
    uint16 mesNumero;

    print("Teste de acesso, lista enumerada\n\n");

    stdout.printf("Informe o numero do mes (1-12): ");
    string entrada = stdin.read_line();
    mesNumero = (uint16) int.parse(entrada);

    mes = (Meses) mesNumero;

    print("Mes definido = %d", mes);
    print(" em extenso equivale a ");

    switch (mes) {
        case Meses.JANEIRO:   print("janeiro");      break;
        case Meses.FEVEREIRO: print("fevereiro");    break;
        case Meses.MARCO:     print("marco");        break;
        case Meses.ABRIL:     print("abril");        break;
        case Meses.MAIO:      print("maio");         break;
        case Meses.JUNHO:     print("junho");        break;
        case Meses.JULHO:     print("julho");        break;
        case Meses.AGOSTO:    print("agosto");       break;
        case Meses.SETEMBRO:  print("setembro");     break;
        case Meses.OUTUBRO:   print("outubro");      break;
        case Meses.NOVEMBRO:  print("novembro");     break;
        case Meses.DEZEMBRO:  print("dezembro");     break;
        default:              print("Mes invalido"); break;
    }

    print("\n\n");

    stdout.printf("Tecle <Enter> para encerrar... ");
    stdin.read_line();

    return 0;
}
