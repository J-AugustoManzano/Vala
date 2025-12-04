// C03EX02

void main() {
    print("Entre o 1o. valor numerico: ");
    var a = (int32) int.parse(stdin.read_line());

    print("Entre o 2o. valor numerico: ");
    var b = (int32) int.parse(stdin.read_line());

    var x = (int32) 0;
    if (a > b) {
        x = a;
        a = b;
        b = x;
    }

    print("Os valores são: %d e %d.\n", a, b);

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
