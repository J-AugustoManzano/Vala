// C06EX10

string inverte(string texto) {
    string reverso = "";
    for (int i = texto.length - 1; i >= 0; i--) {
		// converte char para string
        reverso += texto[i].to_string();
    }
    return reverso;
}

void main() {
    string palavra = "COMPUTADOR";

    print("Palavra ........: " + palavra + "\n\n");
    print("Lado esquerdo ..: " + palavra.substring(0, 3) + "\n");
    print("Centro .........: " + palavra.substring(3, 4) + "\n");
    print("Lado direito ...: " + palavra.substring(
        palavra.length - 3, 3) + "\n");
    print("Reverso ........: " + inverte(palavra) + "\n");
    print("Copias .........: " + 
        palavra + palavra + palavra + "\n");
    print("Tira pedaco ....: " + palavra.substring(0, 
        palavra.length - 3) + "\n");
    string nova_palavra = palavra.substring(0, 6) + "O" + 
        palavra.substring(7);
    print("Nova palavra ...: " + nova_palavra + "\n\n");

    print("Tecle <Enter> para encerrar... ");
    stdin.read_line();
}
