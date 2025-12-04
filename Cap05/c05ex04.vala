// C05EX04

namespace TrocaDeValores {

    int8 a;
    int8 b;

    void troca() {
        int8 x = a;
        a = b;
        b = x;
    }

    public static void main() {
        stdout.printf("Entre um valor para a variavel <A>: ");
        a = (int8) int.parse(stdin.read_line());

        stdout.printf("Entre um valor para a variavel <B>: ");
        b = (int8) int.parse(stdin.read_line());

        troca();

        stdout.printf("\n");
        stdout.printf("Variavel <A> com valor %d\n", a);
        stdout.printf("Variavel <B> com valor %d\n", b);

        stdout.printf("\n");
        stdout.printf("Tecle <Enter> para encerrar... ");
        stdin.read_line();
    }
}
