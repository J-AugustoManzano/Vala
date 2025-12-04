// C05EX10

string data_por_extenso(string data) throws Error {
    bool biss;
    string[] partes = data.split("/");
    if (partes.length != 3)
        throw new Error(Quark.from_string(""), 1, 
            "Formato invalido. Use DD/MM/AAAA.");

    int dia = int.parse(partes[0]);
    int mes = int.parse(partes[1]);
    int ano = int.parse(partes[2]);

    biss = (ano % 4 == 0 && ano % 100 != 0) || (ano % 400 == 0);

    int max_dias = 0;
    switch (mes) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            max_dias = 31;
            break;
        case 4: case 6: case 9: case 11:
            max_dias = 30;
            break;
        case 2:
            max_dias = biss ? 29 : 28;
            break;
    }

    if (dia < 1 || dia > max_dias)
        throw new Error(Quark.from_string(""), 2, 
            "Dia invalido.");

    if (mes < 1 || mes > 12)
        throw new Error(Quark.from_string(""), 3, 
            "Mes invalido.");

    if (ano < 1 || ano > 9999)
        throw new Error(Quark.from_string(""), 4, 
            "Ano invalido");
        
	if (ano == 1582 && mes == 10 && dia >= 5 && dia <= 14)
		throw new Error(Quark.from_string(""), 5, 
		    "Data inexistente.");

    string[] meses = {
        "", 
        "janeiro", 
        "fevereiro", 
        "marco", 
        "abril", 
        "maio", 
        "junho",
        "julho", 
        "agosto", 
        "setembro", 
        "outubro", 
        "novembro", 
        "dezembro"
    };

    return "%d de %s de %d".printf(dia, meses[mes], ano);
}

void mostrar_ajuda() {
    print("Uso: data [opcoes] | <data>\n");
    print("Exemplo: data 26/04/1965\n\n");
    print("Opcoes:\n\n");
    print("  --help       Mostra esta ajuda\n");
    print("  --version    Mostra a versao do programa\n\n");
}

void mostrar_versao() {
    print("Versao 1.0\n\n");
}

int main(string[] args) {
    if (args.length == 1) {
        print("Use: data --help, para instrucoes.\n\n");
        return 0;
    }

    if (args[1] == "--help") {
        mostrar_ajuda();
        return 0;
    } else if (args[1] == "--version") {
        mostrar_versao();
        return 0;
    } else {
        try {
            string resultado = data_por_extenso(args[1]);
            print("Data por extenso: %s\n\n", resultado);
        } catch (Error e) {
            stderr.printf("Erro: %s\n\n", e.message);
        }
    }

    return 0;
}
