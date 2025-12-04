// C06EX02

void main() {
    double[,] notas = new double[8, 4];
    int8 i, j;

    for (i = 0; i <= 7; ++i) {
        print("Entre as notas do aluno %d:\n", i + 1);
        for (j = 0; j <= 3; ++j) {
            print("Nota %d: ", j + 1);
            notas[i, j] = double.parse(stdin.read_line());
        }
        print("\n");
    }

    print("\nRELATORIO DE NOTAS\n\n");
    print("Aluno Nota1 Nota2 Nota3 Nota4\n");
    print("----- ----- ----- ----- -----\n");
    for (i = 0; i <= 7; ++i) {
        print("%5d ", i + 1);
        for (j = 0; j <= 3; ++j)
            print("%5.1f ", notas[i, j]);
        print("\n");
    }

    print("\nTecle <Enter> para encerrar... ");
    stdin.read_line();
}
