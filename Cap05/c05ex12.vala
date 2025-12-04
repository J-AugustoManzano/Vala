// C05EX12

namespace FatorialCauda {

    int64 fatorial_base(int8 n, int64 p) {
        if (n == 0)
            return p;
        else
            return fatorial_base(n - 1, n * p);
    }

    int64 fatorial(int8 n) {
        return fatorial_base(n, 1);
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
