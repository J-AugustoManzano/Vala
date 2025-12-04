// C05EX02

namespace Globais {
    public int8 a;
    public int8 b;
    public int8 x;
}

void main() {
    print("Entre um valor para a variavel <A>: ");
    Globais.a = (int8) int.parse(stdin.read_line());

    print("Entre um valor para a variavel <B>: ");
    Globais.b = (int8) int.parse(stdin.read_line());

    Globais.x = Globais.a;
    Globais.a = Globais.b;
    Globais.b = Globais.x;

    print("\n");
    print("Variavel <A> com valor %d\n", Globais.a);
    print("Variavel <B> com valor %d\n", Globais.b);

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
