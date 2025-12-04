// C03EX10

void main () {
    print("Entre valor para a variavel <A>: ");
    var a = int.parse(stdin.read_line());

    print("Entre valor para a variavel <B>: ");
    var b = int.parse(stdin.read_line());

    print("Entre valor para a variavel <X>: ");
    var x = int.parse(stdin.read_line());

    var c = !(x > 5) ? a + b : a - b;

    print("\nResultado = %d\n", c);

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
