// C09EX03

using Gtk;

// Função auxiliar para criar os botões
void cria_bt(Window jan, Box cx, string tex, MessageType tp) {
    var botao = new Button.with_label(tex);
    botao.clicked.connect(() => {
        var msg = new MessageDialog(
            jan,
            DialogFlags.MODAL,
            tp,
            ButtonsType.OK,
            "Diálogo tipo: %s".printf(tp.to_string())
        );
        msg.run();
        msg.destroy();
    });
    cx.pack_start(botao, false, false, 0);
}

int main (string[] args) {
    Gtk.init(ref args);

    var janela = new Window();
    janela.title = "Tipos de MessageDialog";
    janela.set_default_size(300, 200);
    janela.destroy.connect(Gtk.main_quit);

    var caixa = new Box(Orientation.VERTICAL, 10);
    caixa.margin = 10;

    cria_bt(janela, caixa, "INFO", MessageType.INFO);
    cria_bt(janela, caixa, "WARNING", MessageType.WARNING);
    cria_bt(janela, caixa, "QUESTION", MessageType.QUESTION);
    cria_bt(janela, caixa, "ERROR", MessageType.ERROR);
    cria_bt(janela, caixa, "OTHER", MessageType.OTHER);

    janela.add(caixa);
    janela.show_all();
    Gtk.main();
    return 0;
}
