// C05EX11

namespace FatorialRecursivo {

    int64 fatorial(int8 n) {
        if (n == 0)
            return 1;
        else
            return n * fatorial(n - 1);
    }

    void main() {
        int8 limite;

        stdout.printf("Qual fatorial: ");
        limite = (int8) int.parse(stdin.read_line());

        stdout.printf("Fatorial = %ld\n", 
            (long) fatorial(limite));

        stdout.printf("\n");
        stdout.printf("Tecle <Enter> para encerrar... ");
        stdin.read_line();
    }
}
