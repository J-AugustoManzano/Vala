// C06EX13

void main() {
    string frase1 = "Aprendendo Vala";
    string frase2 = "aprendendo vala";

    // Comparação simples
    if (frase1 == frase2)
        print("As frases sao iguais.\n");
    else
        print("As frases sao diferentes.\n");

    // Comparação ignorando maiúsculas/minúsculas usando casefold()
    if (frase1.casefold() == frase2.casefold())
        print("As frases sao iguais: ignorando maius./minus.\n");
    print("\n");

    // Transformações de formato
    string f1_upper = frase1.up();
    string f1_lower = frase1.down();

    print("Frase em maiusculas: " + f1_upper + "\n");
    print("Frase em minusculas: " + f1_lower + "\n");
    print("\n");

    // Remoção de espaços
    string frase_com_espacos = "    Vala    ";
    print("Antes do trim ....: '" + frase_com_espacos + "'\n");
    print("Após trim ........: '" + frase_com_espacos.strip());
    print("'\n\n");

    print("Tecle <Enter> para encerrar... ");
    stdin.read_line();
}
