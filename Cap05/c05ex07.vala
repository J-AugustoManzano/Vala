// C05EX07

namespace Fatorial {

    int fatorial(int8 n) {
        int8 fat = 1;
        for (int8 i = 1; i <= n; i++) {
            fat *= i;
        }
        return fat;
    }

    int8 limite;

    void main() {
        print("Qual fatorial: ");
        limite = (int8) int.parse(stdin.read_line());
        print("Fatorial = %d\n", fatorial(limite));
        print("\n");
        print("Tecle <Enter> para encerrar... ");
        stdin.read_line();
    }
}
