// C06EX04

void main() {
    string[] a;
    int n;

    stdout.printf("Entre a quantidade de elementos da matriz: ");
    n = int.parse(stdin.read_line());
    stdout.printf("\n");

    a = new string[n];

    for (int i = 0; i <= n-1; ++i) {
        stdout.printf("Entre o %do. nome: ", i + 1);
        a[i] = stdin.read_line().strip();
    }

    stdout.printf("\n");
    stdout.printf("Foram fornecidos os nomes:\n\n");

    for (int i = 0; i <= n-1; ++i) {
        stdout.printf("Nome %d = %s\n", i + 1, a[i]);
    }

    stdout.printf("\n");
    stdout.printf("Tecle <Enter> para encerrar... ");
    stdin.read_line();
}
