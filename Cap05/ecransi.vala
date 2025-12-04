// Biblioteca ANSI (ecransi.vala)
public class Ecransi {
    public enum Color {
        black=0, 
        red=1, 
        green=2, 
        brown=3,
        blue=4,
        magenta=5, 
        cyan=6, 
        lgray=7,
        dgray=8, 
        lred=9, 
        lgreen=10, 
        yellow=11,
        lblue=12, 
        lmagenta=13, 
        lcyan=14, 
        white=15
    }

    public static void clrscr() {
        print("\x1b[2J\x1b[H");
    }

    public static void position(int l, int c) {
        print("\x1b[" + l.to_string() + ";" + c.to_string() + "H");
    }

    public static void text(Color c) {
        int codigo = (int)c;
        if (codigo <= 7)
            print("\x1b[" + (30 + codigo).to_string() + "m");
        else
            print("\x1b[" + (90 + (codigo - 8)).to_string() + "m");
    }

    public static void background(Color c) {
        int codigo = (int)c;
        if (codigo <= 7)
            print("\x1b[" + (40 + codigo).to_string() + "m");
        else
            print("\x1b[" + (100 + (codigo - 8)).to_string() + "m");
    }

    public static void color(Color texto, Color fundo) {
        background(fundo);
        text(texto);
    }

    public static void normal() {
        print("\x1b[0m");
    }
}
