// C06EX12

void main() {
    // Juntando um arranjo de strings manualmente
    string[] palavras = { "Aprendendo", "Vala" };
    string frase1 = "";
    for (int i = 0; i < palavras.length; i++) {
        if (i > 0) frase1 += " "; // adiciona espaço entre palavras
        frase1 += palavras[i];
    }
    print("Usando laco para juntar arranjo ....: " + frase1 + "\n");

    // GLib.StringBuilder
    var sb = new GLib.StringBuilder();
    sb.append("Aprendendo");
    sb.append(" ");
    sb.append("Vala");
    string frase2 = sb.str;
    print("Usando GLib.StringBuilder ..........: " + frase2 + "\n");
    print("\n");

    print("Tecle <Enter> para encerrar... ");
    stdin.read_line();
}
