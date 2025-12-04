// C05EX09

double dividir(double a, double b) throws Error {
    if (b == 0.0)
        throw new Error(Quark.from_string(""), 1, 
            "divisao por zero.");
    return a / b;
}

int main() {
    try {
        print("Entre o dividendo ..: ");
        double dividendo = double.parse(stdin.read_line());
        
        print("Entre o divisor ....: ");
        double divisor = double.parse(stdin.read_line());

        double resultado = dividir(dividendo, divisor);
        print("Resultado: %f\n", resultado);

    } catch (Error e) {
        stderr.printf("Erro: %s\n", e.message);
    }

    return 0;
}
