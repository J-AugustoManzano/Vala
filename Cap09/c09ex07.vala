// C09EX07

using Gtk;
using GLib;
using Gdk;

public class TextEditor : Gtk.Window {
    private Gtk.TextView text_view;
    private Gtk.Statusbar statusbar;
    private const uint CONTEXT_ID = 1;
    private string? current_file_path = null; 
    private bool is_dirty = false;

    public TextEditor() {
        // --- 1. Configuração Básica da Janela ---
        this.title = "Editor de Texto Vala - [Sem Título]";
        this.set_default_size(800, 600);
        this.resizable = true; 
        this.destroy.connect(Gtk.main_quit); 
        this.delete_event.connect(on_close_request);

        var box_vertical = new Gtk.Box(Orientation.VERTICAL, 0);
        this.add(box_vertical);
        
        // --- 2. Criação dos Componentes ---
        var menubar = create_menu_bar();
        box_vertical.pack_start(menubar, false, false, 0); 
        
        this.text_view = new Gtk.TextView();
        this.text_view.wrap_mode = Gtk.WrapMode.WORD;
        
        // Conecta o buffer de texto para rastrear modificações
        this.text_view.get_buffer().changed.connect(on_text_changed);

        var scrolled_window = new Gtk.ScrolledWindow(null, null);
        scrolled_window.add(this.text_view);
        box_vertical.pack_start(scrolled_window, true, true, 0);

        this.statusbar = new Gtk.Statusbar();
        box_vertical.pack_end(this.statusbar, false, false, 0);
        
        show_status("Pronto.");
    }

    // --- 3. Manipulação de Estado e Interface ---

    private void on_text_changed() {
        if (!is_dirty) {
            is_dirty = true;
            update_title();
        }
    }
    
    private void update_title() {
        string filename = current_file_path != null ? 
                          Path.get_basename(current_file_path) : 
                          "Sem Título";
        
        this.title = "Editor de Texto Vala - " + 
            filename + (is_dirty ? "*" : "");
    }
    
    private void show_status(string text) {
        this.statusbar.pop(CONTEXT_ID);
        this.statusbar.push(CONTEXT_ID, text);
    }

    // --- 4. Ações do Menu Arquivo ---

    private void on_new_activated() {
        if (check_unsaved_changes()) {
            this.text_view.get_buffer().set_text("", -1);
            current_file_path = null;
            is_dirty = false;
            update_title();
            show_status("Novo arquivo criado.");
        }
    }

    private void on_open_activated() {
        if (!check_unsaved_changes()) return;

        var dialog = new 
            Gtk.FileChooserDialog("Abrir Arquivo", this, 
                       Gtk.FileChooserAction.OPEN, 
                       "_Cancelar", Gtk.ResponseType.CANCEL, 
                       "_Abrir", Gtk.ResponseType.ACCEPT);

        if (dialog.run() == Gtk.ResponseType.ACCEPT) {
            string filename = dialog.get_filename();
            dialog.destroy();
            
            try {
                var file = GLib.File.new_for_path(filename);
                var stream = file.read(null); 
                var input = new GLib.DataInputStream(stream); 
                
                string full_content = "";
                string? line;
                size_t bytes_read;

                // Lendo linha por linha e concatenando o conteúdo
                while ((line = input.read_line(out bytes_read, null))
                    != null) {
                    full_content += line + "\n"; 
                }

                this.text_view.get_buffer().set_text(full_content, -1);
                current_file_path = filename;
                is_dirty = false;
                update_title();
                show_status("Arquivo " + filename + " aberto.");
                
                input.close(); 
                stream.close();

            } catch (Error e) {
                show_error("Erro ao abrir arquivo: " + e.message);
            }
        } else {
            dialog.destroy();
        }
    }

    private void on_save_activated() {
        if (current_file_path == null) {
            on_save_as_activated();
        } else {
            save_file(current_file_path);
        }
    }

    private void on_save_as_activated() {
        var dialog = new 
            Gtk.FileChooserDialog("Salvar Arquivo Como", this, 
                       Gtk.FileChooserAction.SAVE, 
                       "_Cancelar", Gtk.ResponseType.CANCEL, 
                       "_Salvar", Gtk.ResponseType.ACCEPT);
        
        if (current_file_path != null) {
            dialog.set_current_name(
                Path.get_basename(current_file_path)
            );
        }

        if (dialog.run() == Gtk.ResponseType.ACCEPT) {
            string filename = dialog.get_filename();
            dialog.destroy();
            current_file_path = filename;
            save_file(filename);
        } else {
            dialog.destroy();
        }
    }
    
    private void save_file(string filename) {
        try {
            string content = this.text_view.get_buffer().text;
            var file = GLib.File.new_for_path(filename);
            var stream = file.replace(
                null, false, GLib.FileCreateFlags.NONE, null
            );
            var output = new GLib.DataOutputStream(stream);
            
            // put_string escreve o texto no stream
            output.put_string(content);
            
            output.close();
            stream.close();
            
            is_dirty = false;
            update_title();
            show_status("Arquivo salvo como " + filename);
        } catch (Error e) {
            show_error("Erro ao salvar arquivo: " + e.message);
        }
    }

    private void on_close_activated() {
        if (check_unsaved_changes()) {
            this.destroy(); 
        }
    }
    
    // --- 5. Ações do Menu Editar ---

    private void on_copy_activated() {
        this.text_view.get_buffer().copy_clipboard(
            this.text_view.get_clipboard(Gdk.SELECTION_CLIPBOARD)
        );
        show_status("Texto copiado.");
    }

    private void on_paste_activated() {
        this.text_view.get_buffer().paste_clipboard(
            this.text_view.get_clipboard(
                Gdk.SELECTION_CLIPBOARD
            ), null, true
        );
        show_status("Texto colado.");
    }

    private void on_cut_activated() {
        this.text_view.get_buffer().cut_clipboard(
            this.text_view.get_clipboard(
                Gdk.SELECTION_CLIPBOARD
            ), true
        );
        show_status("Texto recortado.");
    }
    
    // --- 6. Helpers de Diálogo/Mensagens ---

    private bool check_unsaved_changes() {
        if (!is_dirty) return true;

        var dialog = new Gtk.MessageDialog(this, 
            Gtk.DialogFlags.MODAL | 
            Gtk.DialogFlags.DESTROY_WITH_PARENT,
            Gtk.MessageType.WARNING,
            Gtk.ButtonsType.NONE, 
            "Existem alterações não salvas. Deseja salvar?"
        );
        
        dialog.add_button("Salvar", Gtk.ResponseType.YES);
        dialog.add_button("Nao Salvar", Gtk.ResponseType.NO);
        dialog.add_button("Cancelar", Gtk.ResponseType.CANCEL);

        dialog.set_title("Salvar Alterações");

        int response = dialog.run();
        dialog.destroy();

        if (response == Gtk.ResponseType.YES) {
            on_save_activated(); 
            return !is_dirty; 
        } else if (response == Gtk.ResponseType.NO) {
            return true; 
        }
        return false; 
    }

    private bool on_close_request(Gdk.EventAny event) {
        return !check_unsaved_changes();
    }

    private void show_error(string message) {
        var dialog = 
            new Gtk.MessageDialog(this, 
                                  Gtk.DialogFlags.MODAL,
                                  Gtk.MessageType.ERROR,
                                  Gtk.ButtonsType.CLOSE,
                                  message);
        dialog.run();
        dialog.destroy();
    }
    
    // --- 7. Criação da Barra de Menu ---
    
    private Gtk.MenuBar create_menu_bar() {
        var menubar = new Gtk.MenuBar();
        
        // Menu Arquivo
        var menu_arquivo = new Gtk.Menu();
        var item_arquivo = 
            new Gtk.MenuItem.with_mnemonic("_Arquivo");
        item_arquivo.set_submenu(menu_arquivo);
        menubar.append(item_arquivo);
        
        var item_novo = 
            new Gtk.MenuItem.with_mnemonic("_Novo");
        item_novo.activate.connect(on_new_activated);
        menu_arquivo.append(item_novo);

        var item_abrir = 
            new Gtk.MenuItem.with_mnemonic("_Abrir");
        item_abrir.activate.connect(on_open_activated);
        menu_arquivo.append(item_abrir);

        var item_salvar = 
            new Gtk.MenuItem.with_mnemonic("_Salvar");
        item_salvar.activate.connect(on_save_activated);
        menu_arquivo.append(item_salvar);
        
        var item_salvar_como = 
            new Gtk.MenuItem.with_mnemonic("Salvar _Como...");
        item_salvar_como.activate.connect(on_save_as_activated);
        menu_arquivo.append(item_salvar_como);

        menu_arquivo.append(new Gtk.SeparatorMenuItem());
        
        var item_fechar = 
            new Gtk.MenuItem.with_mnemonic("_Fechar");
        item_fechar.activate.connect(on_close_activated);
        menu_arquivo.append(item_fechar);

        var item_sair = 
            new Gtk.MenuItem.with_mnemonic("_Sair");
        item_sair.activate.connect(Gtk.main_quit);
        menu_arquivo.append(item_sair);

        // Menu Editar
        var menu_editar = new Gtk.Menu();
        var item_editar = 
            new Gtk.MenuItem.with_mnemonic("_Editar");
        item_editar.set_submenu(menu_editar);
        menubar.append(item_editar);

        var item_copiar = 
            new Gtk.MenuItem.with_mnemonic("_Copiar");
        item_copiar.activate.connect(on_copy_activated);
        menu_editar.append(item_copiar);

        var item_colar = 
            new Gtk.MenuItem.with_mnemonic("Co_lar");
        item_colar.activate.connect(on_paste_activated);
        menu_editar.append(item_colar);

        var item_recortar = 
            new Gtk.MenuItem.with_mnemonic("_Recortar");
        item_recortar.activate.connect(on_cut_activated);
        menu_editar.append(item_recortar);

        return menubar;
    } 
} 

int main(string[] args) {
    Gtk.init(ref args);

    var editor = new TextEditor();
    editor.show_all();
    Gtk.main();
    return 0;
}
