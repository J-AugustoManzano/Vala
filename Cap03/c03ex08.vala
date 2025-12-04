// C03EX08

void main () {
    print("Escolha o tipo de transporte:\n\n");
    print("[M] - Motocicleta\n");
    print("[S] - Scooter\n\n");

    print("==> ");
    char transp = stdin.read_line().up()[0];

    print("\n");
    if (transp == 'M' || transp == 'S')
        print("Transporte valido.\n");
    else
        print("Transporte invalido.\n");

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
