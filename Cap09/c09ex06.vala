// C09EX06

using Gtk;

// Variável global para o Statusbar ( controle de mensagens)
const uint CONTEXT_ID = 1;

// Define uma classe para a janela principal
public class MainWindow : Gtk.Window {

    private Gtk.Statusbar statusbar;

    public MainWindow() {
        // Configuração da Janela Principal
        this.title = "Programa com Menu e Statusbar";
        this.set_default_size(500, 350);
        this.set_decorated(true); 
        this.destroy.connect(Gtk.main_quit); 

        var caixa_principal = 
            new Gtk.Box(Orientation.VERTICAL, 0);
        this.add(caixa_principal);

        // Criação da Statusbar
        this.statusbar = new Gtk.Statusbar();
        caixa_principal.pack_end(
            this.statusbar, false, false, 0
        ); 

        // Criação da Barra de Menu
        var menubar = new Gtk.MenuBar();
        caixa_principal.pack_start(menubar, false, false, 0); 
        
        // Estrutura do Menu 'Arquivo'
        var menu_arquivo = new Gtk.Menu();
        var menu_item_arquivo = 
            new Gtk.MenuItem.with_mnemonic("_Arquivo");
        menu_item_arquivo.set_submenu(menu_arquivo);
        menubar.append(menu_item_arquivo);

        // Item: Novo
        var item_novo = 
            new Gtk.MenuItem.with_mnemonic("_Novo");
        menu_arquivo.append(item_novo);
        item_novo.activate.connect(
            () => { 
		this.show_status("Ação: Novo arquivo criado!"); 
            });
        this.connect_status_events(
            item_novo, "Cria um novo arquivo vazio (Alt+N)"
        );

        // Item: Abrir (Esmaecido)
        var item_abrir = 
            new Gtk.MenuItem.with_mnemonic("_Abrir");
        item_abrir.set_sensitive(false); 
        menu_arquivo.append(item_abrir);
        this.connect_status_events(
            item_abrir, "Comando temporariamente indisponível."
        );
        
        // Separador
        menu_arquivo.append(new Gtk.SeparatorMenuItem()); 
        
        // Item: Sair
        var item_sair = 
            new Gtk.MenuItem.with_mnemonic("_Sair");
        menu_arquivo.append(item_sair);
        item_sair.activate.connect(Gtk.main_quit);
        this.connect_status_events(
            item_sair, "Encerra o programa (Alt+F4)"
        );

        // Estrutura do Menu 'Ajuda' (com Sub-Menu)
        var menu_ajuda = new Gtk.Menu();
        var menu_item_ajuda = 
            new Gtk.MenuItem.with_mnemonic("_Ajuda");
        menu_item_ajuda.set_submenu(menu_ajuda);
        menubar.append(menu_item_ajuda);
        
        // Sub-menu: Opções
        var menu_opcoes = new Gtk.Menu();
        var item_opcoes_menu = 
            new Gtk.MenuItem.with_mnemonic("_Opções");
        item_opcoes_menu.set_submenu(menu_opcoes);
        menu_ajuda.append(item_opcoes_menu);
        this.connect_status_events(
            item_opcoes_menu, "Configurações avançadas."
        );
        
        // Item dentro de 'Opções'
        var item_preferencias = 
            new Gtk.MenuItem.with_mnemonic("_Preferências");
        menu_opcoes.append(item_preferencias);
        item_preferencias.activate.connect(
            () => { 
                 this.show_status("Ação: Preferências abertas!"); 
         });
        this.connect_status_events(
            item_preferencias, "Define aparência/comportamento."
        );

        // Item: Sobre
        var item_sobre = 
            new Gtk.MenuItem.with_mnemonic("_Sobre");
        menu_ajuda.append(item_sobre);
        item_sobre.activate.connect(
            () => { 
		this.show_status("Ação: Informações sobre..."); 
            });
        this.connect_status_events(
            item_sobre, "Informações sobre a versão do programa."
        );
        
    }

    // Funções como métodos privados da classe
    private void show_status(string text) {
        this.statusbar.pop(CONTEXT_ID);
        this.statusbar.push(CONTEXT_ID, text);
    }

    private void clear_status() {
        this.statusbar.pop(CONTEXT_ID);
    }
    
    // Função helper para conectar eventos de mouse
    private void connect_status_events(
        Gtk.MenuItem item, string description
    ) {
        item.enter_notify_event.connect(() => {
            this.show_status(description);
            return false;
        });
        item.leave_notify_event.connect(() => {
            this.clear_status();
            return false;
        });
    }

}

int main(string[] args) {
    Gtk.init(ref args);

    var janela = new MainWindow();
    janela.show_all();
    Gtk.main();
    return 0;
}
   
