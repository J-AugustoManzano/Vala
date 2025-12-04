// C05EX13

int main() {
    Ecransi.clrscr();

    Ecransi.position(2, 5);
    Ecransi.color(Ecransi.Color.blue, Ecransi.Color.white);
    print("Texto azul com fundo branco\n");

    Ecransi.position(4, 5);
    Ecransi.color(Ecransi.Color.red, Ecransi.Color.yellow);
    print("Texto vermelho com fundo amarelo\n");

    Ecransi.position(6, 5);
    Ecransi.color(Ecransi.Color.yellow, Ecransi.Color.green);
    print("Texto amarelo com fundo verde\n");

    Ecransi.normal();
    Ecransi.position(8, 5);
    print("Texto normal restaurado\n");
    
    Ecransi.position(12,25);
    print("Tecle <Enter> para encerrar... ");
    stdin.read_line();
    return 0;    
}
