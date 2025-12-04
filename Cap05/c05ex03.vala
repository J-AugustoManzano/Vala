// C05EX03

namespace Globais {
    public int8 a;
    public int8 b;
}

void troca() {
    int8 x = Globais.a;
    Globais.a = Globais.b;
    Globais.b = x;
}

void main() {
    stdout.printf("Entre um valor para a variavel <A>: ");
    Globais.a = (int8) int.parse(stdin.read_line());

    stdout.printf("Entre um valor para a variavel <B>: ");
    Globais.b = (int8) int.parse(stdin.read_line());

    troca();

    stdout.printf("\n");
    stdout.printf("Variavel <A> com valor %d\n", Globais.a);
    stdout.printf("Variavel <B> com valor %d\n", Globais.b);

    stdout.printf("\n");
    stdout.printf("Tecle <Enter> para encerrar... ");
    stdin.read_line();
}
