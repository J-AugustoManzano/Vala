// C03EX05

void main() {
    print("Entre com um numero equivalente a um mes: ");
    int32 mes = (int32) int.parse(stdin.read_line());

    switch (mes) {
        case 1:
            print("Janeiro\n");
            break;
        case 2:
            print("Fevereiro\n");
            break;
        case 3:
            print("Marco\n");
            break;
        case 4:
            print("Abril\n");
            break;
        case 5:
            print("Maio\n");
            break;
        case 6:
            print("Junho\n");
            break;
        case 7:
            print("Julho\n");
            break;
        case 8:
            print("Agosto\n");
            break;
        case 9:
            print("Setembro\n");
            break;
        case 10:
            print("Outubro\n");
            break;
        case 11:
            print("Novembro\n");
            break;
        case 12:
            print("Dezembro\n");
            break;
        default:
            print("Mes invalido\n");
            break;
    }

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
