// C09EX05

using Gtk;

int main(string[] args) {
    Gtk.init(ref args);

    // Janela principal
    var janela = new Window();
    janela.title = "Soma de Valores";
    janela.set_default_size(350, 180);
    janela.set_deletable(false);

    var caixa_principal = new Box(Orientation.VERTICAL, 10);
    caixa_principal.margin = 15;
    janela.add(caixa_principal);

    // --- Linha Valor A ---
    var linha_a = new Box(Orientation.HORIZONTAL, 10);
    var rotulo_a = new Label(null);
    rotulo_a.set_markup("<b>Valor A:</b>");
    rotulo_a.set_xalign(0); // alinha à esquerda

    var entrada_a = new Entry();
    linha_a.pack_start(rotulo_a, false, false, 0);
    linha_a.pack_start(entrada_a, true, true, 0);
    caixa_principal.pack_start(linha_a, false, false, 0);

    // --- Linha Valor B ---
    var linha_b = new Box(Orientation.HORIZONTAL, 10);
    var rotulo_b = new Label(null);
    rotulo_b.set_markup("<b>Valor B:</b>");
    rotulo_b.set_xalign(0);

    var entrada_b = new Entry();
    linha_b.pack_start(rotulo_b, false, false, 0);
    linha_b.pack_start(entrada_b, true, true, 0);
    caixa_principal.pack_start(linha_b, false, false, 0);

    // --- Rótulo de resultado ---
    var rotulo_resultado = new Label(null);
    rotulo_resultado.set_markup(
        "<span color='blue'><b>Resultado:</b></span>"
    );
    rotulo_resultado.set_xalign(0);
    caixa_principal.pack_start(
        rotulo_resultado, false, false, 0
    );

    // --- Botões ---
    var caixa_botoes = new Box(Orientation.HORIZONTAL, 10);
    var botao_somar = new Button.with_label("Somar");
    var botao_sair = new Button.with_label("Sair");

    botao_somar.clicked.connect(() => {
        double a = 0.0;
        double b = 0.0;

        if (double.try_parse(entrada_a.text, out a) &&
            double.try_parse(entrada_b.text, out b)) {

            rotulo_resultado.set_markup(
                "<span color='blue'><b>" +
                "Resultado: %.2f".printf(a + b) +
                "</b></span>"
            );
        } else {
            rotulo_resultado.set_markup(
                "<span color='red'><b>" +
                "Erro: entre somente números!" +
                "</b></span>"
            );
        }
    });

    botao_sair.clicked.connect(() => Gtk.main_quit());

    caixa_botoes.pack_start(botao_somar, true, true, 0);
    caixa_botoes.pack_start(botao_sair, true, true, 0);
    caixa_principal.pack_start(caixa_botoes, false, false, 0);

    janela.show_all();
    Gtk.main();
    return 0;
}    
