// C03EX09

void main () {
    print("Classificacao esportiva\n\n");
    print("Entre '1' se atleta pontuou na 1a. prova\n");
    print("Entre '1' se atleta pontuou na 2a. prova\n");
    print("Qualquer outro valor se nao pontuou nas provas\n\n");

    print("Prova 1: ");
    var p1 = (int8) int.parse(stdin.read_line());

    print("Prova 2: ");
    var p2 = (int8) int.parse(stdin.read_line());

    if ((p1 == 1) != (p2 == 1))
        print("Atleta participa da terceira prova.\n");
    else {
        print("Atleta nao participa da terceira prova.\n");
        if (p1 == 1 && p2 == 1)
            print("Classificado para a final.\n");
        else
            print("Desclassificado da competicao.\n");
    }

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
