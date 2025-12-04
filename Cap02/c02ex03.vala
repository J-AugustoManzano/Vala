// C01EX03

void main() {
    double x =  1.0;
    double y =  2.0;
    double z = -5.5;

    // Funções trigonométricas
    print("arccos(x)        = %8.5f\n", Math.acos(x));
    print("arccosh(x)       = %8.5f\n", Math.acosh(x));
    print("arcsin(x)        = %8.5f\n", Math.asin(x));
    print("arcsinh(x)       = %8.5f\n", Math.asinh(x));
    print("arctan(x)        = %8.5f\n", Math.atan(x));
    print("arctan1(x, y)    = %8.5f\n", Math.atan2(x, y));

    print("cos(x)           = %8.5f\n", Math.cos(x));
    print("cosh(x)          = %8.5f\n", Math.cosh(x));
    print("sin(x)           = %8.5f\n", Math.sin(x));
    print("sinh(x)          = %8.5f\n", Math.sinh(x));
    print("tan(x)           = %8.5f\n", Math.tan(x));
    print("tanh(x)          = %8.5f\n", Math.tanh(x));

    // Exponenciais, logaritmos e potências
    print("exp(x)           = %8.5f\n", Math.exp(x));
    print("log(x)           = %8.5f\n", Math.log(x));
    print("pow(x, y)        = %8.5f\n", Math.pow(x, y));

    // Arredondamento e raiz quadrada
    print("round(z)         = %8.5f\n", Math.round(z));
    print("sqrt(x)          = %8.5f\n", Math.sqrt(x));

    // Piso, teto e positivo
    print("floor(z)         = %8.5f\n", Math.floor(z));
    print("ceil(z)          = %8.5f\n", Math.ceil(z));
    print("abs(z)           = %8.5f\n", Math.fabs(z));

    print("\nTecle <Enter> para finalizar... ");
    stdin.read_line();
}          
