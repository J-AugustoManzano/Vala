// C07EX12

int tarefas_concluidas = 0;
int total_tarefas = 3;
MainLoop laco;

void verificar_fim() {
    tarefas_concluidas++;
    if (tarefas_concluidas == total_tarefas) {
        print("\nTarefas assincronas encerradas.\n");
        laco.quit();
    }
}

public static int main() {
    laco = new MainLoop();

    // Tarefa assíncrona 1
    Timeout.add(3000, () => {
        print("[Tarefa 1] concluida apos   3 segundos\n");
        verificar_fim();
        return false;
    });

    // Tarefa assíncrona 2
    Timeout.add(6000, () => {
        print("[Tarefa 2] concluida apos   6 segundos\n");
        verificar_fim();
        return false;
    });

    // Tarefa assíncrona 3
    Timeout.add(1500, () => {
        print("[Tarefa 3] concluIda apos 1,5 segundos\n");
        verificar_fim();
        return false;
    });

    print("\n");
    print("O programa esta executando o codigo principal ");
    print("enquanto as tarefas assincronas ocorrem...\n\n");

    laco.run();  // Mantém o programa ativo até as tarefas terminarem

    print("\nPrograma finalizado.\n\n");
    
    print("Tecle <Enter> para encerrar... ");
    stdin.read_line();

    return 0;
}
