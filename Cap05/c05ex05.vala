// C05EX05

namespace Fatorial {

    void fatorial(int8 n) {
        int8 fat = 1;
        for (int8 i = 1; i <= n; i++) {
            fat *= i;
        }
        stdout.printf("Fatorial = %d\n", fat);
    }
    
    int8 limite;
    
    void main() {
        stdout.printf("Qual fatorial: ");
        limite = (int8) int.parse(stdin.read_line());

        fatorial(limite);

        stdout.printf("\n");
        stdout.printf("Tecle <Enter> para encerrar... ");
        stdin.read_line();
    }
}
