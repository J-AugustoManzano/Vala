// C03EX07

void main () {
    print("Entre um numero inteiro: ");
    int32 numero = (int32) int.parse(stdin.read_line());

    if ((numero >= 20) && (numero <= 90))
        print("O numero esta na faixa de 20 a 90.\n");
    else
        print("O numero esta fora da faixa de 20 a 90.\n");

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
