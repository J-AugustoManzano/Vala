// C05EX08

namespace Comparador {

    bool igual(int8 a, int8 b) {
        return a == b;
    }

    void main() {
        int8 x, y;

        stdout.printf("Informe o 1o. valor: ");
        x = (int8) int.parse(stdin.read_line());

        stdout.printf("Informe o 2o. valor: ");
        y = (int8) int.parse(stdin.read_line());

        if (igual(x, y))
            stdout.printf("Valores sao iguais\n");
        else
            stdout.printf("Valores sao diferentes\n");

        stdout.printf("\n");
        stdout.printf("Tecle <Enter> para encerrar... ");
        stdin.read_line();
    }
}
