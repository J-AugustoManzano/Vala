// C09EX04

using Gtk;

int main(string[] args) {
    Gtk.init(ref args);

    // Janela principal
    var janela = new Window();
    janela.title = "Exemplo Widgets GTK";
    janela.set_default_size(400, 200);
    janela.destroy.connect(Gtk.main_quit);

    var caixa = new Box(Orientation.VERTICAL, 10);
    caixa.margin = 10;
    janela.add(caixa);

    // 1. Button
    var botao = new Button.with_label("Button");
    botao.clicked.connect(() => print("Button acionado!\n"));
    caixa.pack_start(botao, false, false, 0);

    // 2. ToggleButton
    var toggle = new ToggleButton.with_label("ToggleButton");
    toggle.toggled.connect(() => print(
        "ToggleButton: %s\n".printf(
        toggle.active ? "Ligado" : "Desligado"))
    );
    caixa.pack_start(toggle, false, false, 0);

    // 3. CheckButton
    var check = new CheckButton.with_label("CheckButton");
    check.toggled.connect(() => print("CheckButton: %s\n".printf(
        check.active ? "Selecionado" : "Não selecionado"))
    );
    caixa.pack_start(check, false, false, 0);

    // 4. RadioButtons
    var radio1 = 
        new RadioButton.with_label(null, "Opção 1");
    var radio2 = 
        new RadioButton.with_label(radio1.get_group(), 
        "Opção 2");
    
    radio1.toggled.connect(() => { 
		if (radio1.active) 
		    print("RadioButton 1 selecionado\n"); 
	});
	
    radio2.toggled.connect(() => { 
		if (radio2.active) 
		    print("RadioButton 2 selecionado\n"); 
	});
	
    caixa.pack_start(radio1, false, false, 0);
    caixa.pack_start(radio2, false, false, 0);

    // 5. ToolButton em Toolbar
    var barra_ferramentas = 
        new Toolbar();
    var imagem_ferramenta = 
        new Image.from_icon_name(
        "list-add-symbolic", IconSize.SMALL_TOOLBAR // Botão [+]
    );
    var botao_ferramenta = new ToolButton(
        imagem_ferramenta, "Adicionar"
    );
    
    botao_ferramenta.clicked.connect(() => 
        print("ToolButton clicado\n"));
    
    barra_ferramentas.insert(botao_ferramenta, -1);
    caixa.pack_start(barra_ferramentas, false, false, 0);

    // Mostrar tudo
    janela.show_all();
    Gtk.main();
    return 0;
}       
