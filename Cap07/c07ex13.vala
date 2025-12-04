// C07EX13

class Tarefa : Object {
    public int id;
    public int tmp;

    public signal void concluida(int id);

    public Tarefa(int id, int tmp) {
        this.id = id;
        this.tmp = tmp;
    }

    public void iniciar() {
        print("A [Tarefa %d], em %d segundos...\n", id, tmp);

        Timeout.add(tmp * 1000, () => {
            print("\n[Tarefa %d] concluida!", id);
            this.concluida(id); // emite sinal
            return false;
        });
    }
}

int tarefas_concluidas = 0;
int total_tarefas = 3;
MainLoop laco;

void ao_terminar_tarefa(int id) {
    tarefas_concluidas++;
    if (tarefas_concluidas == total_tarefas) {
        print("\n\nTarefas assincronas encerradas.\n");
        laco.quit();
    }
}

int main() {
    laco = new MainLoop();

    print("O programa continua executando enquanto as ");
    print("tarefas assincronas ocorrem...\n\n");

    // Cria tarefas
    Tarefa t1 = new Tarefa(1, 3);
    Tarefa t2 = new Tarefa(2, 6);
    Tarefa t3 = new Tarefa(3, 1);

    // Conecta callbacks
    t1.concluida.connect(ao_terminar_tarefa);
    t2.concluida.connect(ao_terminar_tarefa);
    t3.concluida.connect(ao_terminar_tarefa);

    // Inicia tarefas
    t1.iniciar();
    t2.iniciar();
    t3.iniciar();

    laco.run();

    print("\nPrograma finalizado.\n\n");
    
    print("Tecle <Enter> para encerrar... ");
    stdin.read_line();

    return 0;
}
