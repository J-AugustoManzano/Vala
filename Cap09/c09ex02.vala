// C09EX02

using Gtk;

int main (string[] args) {
    Gtk.init(ref args);

    var janela = new Window ();
    janela.title = "Exemplo ";
    janela.set_default_size(300, 200);

    // Container para posicionamento do componente botão
    var area = new Fixed ();

    // Componente Botão
    var botao = new Button.with_label("Clique aqui");
    botao.set_size_request(100, 40);
    area.put(botao, 100, 80); // posição x = 100, y = 80

    // Conectar o clique do botão
    botao.clicked.connect (() => {
        var msg = new MessageDialog (
            janela,
            DialogFlags.MODAL,
            MessageType.INFO,
            ButtonsType.OK,
            "Botão foi acionado!"
        );
        msg.run();  // mostra a caixa
        msg.destroy();
    });

    janela.add(area);
    janela.destroy.connect(Gtk.main_quit);
    janela.show_all();

    Gtk.main();
    return 0;
}
