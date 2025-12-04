// C05EX06

namespace Fatorial {

    void fatorial(int8 n, ref int8 fat) {
        fat = 1;
        for (int8 i = 1; i <= n; i++) {
            fat *= i;
        }
    }

    int8 resp;
    int8 limite;

    void main() {
        resp = 1;

        print("Qual fatorial: ");
        limite = (int8) int.parse(stdin.read_line());

        fatorial(limite, ref resp);

        print("Fatorial = %d\n", resp);

        print("\n");
        print("Tecle <Enter> para encerrar... ");
        stdin.read_line();
    }
}
