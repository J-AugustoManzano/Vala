// C03EX04

void main() {
    print("Entre a 1a. nota .......: ");
    double n1 = double.parse(stdin.read_line());

    print("Entre a 2a. nota .......: ");
    double n2 = double.parse(stdin.read_line());

    print("Entre a 3a. nota .......: ");
    double n3 = double.parse(stdin.read_line());

    print("Entre a 4a. nota .......: ");
    double n4 = double.parse(stdin.read_line());
    print("\n");

    double md1 = (n1 + n2 + n3 + n4) / 4;

    if (md1 >= 7) {
        print("Aprovado\n");
        print("Media: %.2f\n", md1);
    } else {
        print("Entre a nota de exame ..: ");
        double ne = double.parse(stdin.read_line());
        print("\n");

        double md2 = (md1 + ne) / 2;

        if (md2 >= 5)
            print("Aprovado em exame\n");
        else
            print("Reprovado\n");
        print("Media: %.2f\n", md2);
    }

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}

