// C06EX11

void main() {
    string frase = "Aprendendo Vala com o Professor Manzano";
    string[] palavra;

    print("Frase ......: " + frase + "\n");
    print("              ---------------------------------------\n");
    print("              000000000111111111122222222223333333333\n");
    print("              012345678901234567890123456789012345678\n");
    print("\n");

    print("Tamanho ....: " + frase.length.to_string());
    print(" caracteres\n\n");

    palavra = frase.split(" ");

    print("Palavra 1 .............: " + palavra[0] + "\n");
    print("Palavra 2 .............: " + palavra[1] + "\n");
    print("Palavra 3 .............: " + palavra[2] + "\n");
    print("Palavra 4 .............: " + palavra[3] + "\n");
    print("\n");

    print("Letra 1 da Palavra 1 ..: " + palavra[0][0].to_string()); 
    print("\n");
    print("Letra 2 da Palavra 1 ..: " + palavra[0][1].to_string()); 
    print("\n");
    print("Letra 3 da Palavra 1 ..: " + palavra[0][2].to_string()); 
    print("\n");
    print("Letra 4 da Palavra 1 ..: " + palavra[0][3].to_string()); 
    print("\n\n");

    int posicao = frase.index_of("Vala"); 
    print("A palavra 'Vala' na posicao: " + posicao.to_string());
    print("\n\n");

    print("Tecle <Enter> para encerrar... ");
    stdin.read_line();
}   
