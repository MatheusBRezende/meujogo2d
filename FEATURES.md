# Documento de Funcionalidades

> Referência completa de TUDO que o jogo terá. Dividido por Era e prioridade.
> Quando for implementar algo, consulta aqui primeiro.

---

## SISTEMAS GLOBAIS (funcionam em todas as Eras)

### Sistema de Tempo
- [x] Horas e dias passando
- [x] Multiplicador de velocidade (+ e -)
- [x] Pause/unpause restaurando velocidade anterior

### Sistema de Câmera
- [x] Zoom com scroll do mouse (limite mín/máx)
- [x] Mover câmera arrastando com botão do meio
- [x] Zoom e follow ao clicar num robô
- [ ] Remapeamento de teclas (tela de configurações futuramente)

### Sistema de Seleção de Robôs
- [x] Clique esquerdo seleciona 1 robô (zoom + UI de status)
- [ ] Arrastar com botão remapeável cria área de seleção múltipla
- [ ] Shift + clique adiciona robô à seleção atual
- [ ] Ctrl + clique direito seleciona todos
- [ ] UI de grupo aparece quando múltiplos robôs selecionados

### Sistema de Tarefas do Robô
**Prioridades (ordem decrescente):**
1. Energia crítica → vai recarregar imediatamente (para qualquer outra tarefa)
2. Tarefa designada pelo jogador (coletar recurso específico ou categoria)
3. Idle (parado, animação idle)

**Tipos de tarefa:**
- [ ] Coletar recurso específico (jogador clica num recurso no mapa)
- [ ] Coletar categoria (jogador escolhe "coletar gravetos" na UI)
- [ ] Recarregar (automático quando energia crítica)
- [x] Idle

### Inventário do Robô
- [x] Dicionário de recursos: `{"graveto": 0, "pedra": 0, "madeira": 0, "minerio_de_ferro": 0}`
- [ ] Capacidade máxima por robô (ainda a definir)
- [ ] Quando cheio, vai depositar no armazém/hub antes de continuar
- [ ] UI mostrando inventário ao selecionar robô

### Armazém Global (Hub)
- [ ] Totais globais de recursos da civilização
- [ ] UI no canto da tela mostrando: gravetos, pedras, madeira, energia armazenada
- [ ] Robôs depositam recursos aqui ao terminar coleta ou quando cheios

---

## ERA 1 — Sobrevivência

### Recursos no Mapa
- [ ] Graveto (recurso finito, some ao coletar, script genérico)
- [ ] Pedra (recurso finito, some ao coletar, script genérico)
- [ ] Painel Solar (regenera energia, já implementado)
- [ ] Minério de Ferro
- [ ] Minério de Cobre 

### Sistema de Energia (Era 1)
- [x] Robô recarrega direto no painel solar
- [x] Robô para tudo e vai recarregar quando energia crítica
- [ ] Banco de Bateria: construção simples que armazena energia
  - Painéis solares carregam o banco automaticamente
  - Robôs recarregam no banco (mais eficiente que painel direto)
  - **Postes e conexões ficam para Era 2/3**

### Construções (Era 1)
> Todas as construções custam recursos e são posicionadas pelo jogador

| Construção | Custo | Função |
|---|---|---|
| Hub Principal | — (já existe no início) | Base dos robôs, armazém central |
| Banco de Bateria | 10 gravetos + 5 pedras | Armazena e distribui energia |
| Oficina | 15 gravetos + 10 pedras | Cria novos robôs |
| Depósito de Recursos | 10 gravetos + 5 pedras | Armazém secundário |
| Fornalha | 20 pedras | Pode usar gravetos como combustível para derreter ferro e cobre | 15s para criar lingotes
| Biblioteca | 20 gravetos + 10 pedras | Gera conhecimento |

### Início do Jogo (Era 1)
- [ ] Hub principal spawna no centro do mapa
- [ ] 5 robôs spawnам no hub (lore: NÃO SEI VOU PENSAR)
- [ ] Raio de ~300px ao redor do hub garante recursos básicos (gravetos, pedras, painéis)
- [ ] Fora do raio: recursos mais escassos, requer expansão

### Condição de Avanço (Era 1 → Era 2)
- [ ] ???
- [ ] ???
- [ ] Tela de transição de Era (simples por enquanto)

---

## ERA 2 — Reconstrução (PLANEJAMENTO FUTURO)

- [ ] ???
- [ ] ???
- [ ] ???
- [ ] ???
- [ ] ???

---

## ERA 3 — Sociedade (PLANEJAMENTO FUTURO)

- [ ] ???
- [ ] ???
- [ ] ???
- [ ] ???

---

## ERA 4 — Industrial (PLANEJAMENTO FUTURO)

- [ ] ???
- [ ] ???
- [ ] ???
- [ ] ???

---

## ERA 5 — Pós-humano (PLANEJAMENTO FUTURO)

- [ ] ???
- [ ] ???
- [ ] ???
- [ ] ???

---

## IDEIAS FUTURAS (sem Era definida)

- Click no robô pra ver status individual ✅
- Emojis/conversas aleatórias entre robôs
- Overstress: robô sem dormir → desliga
- Progressão visual do robô entre Eras
- Mapa procedural com FastNoiseLite
- Mapa mundi com outras colônias (Era 3+)
- Comércio entre colônias
- Adicionar menu que permita alterar teclas
- Implementar uma forma de wandar aleatoriamente no mapa para robos
- Remapeamento de teclas na tela de configurações
- Postes de energia (Era 1)
- Menu principal
- Tela de configurações

---

## PRÓXIMOS PASSOS (ordem sugerida)

1. [ ] Script genérico de recurso (graveto/pedra)
2. [ ] Robô coleta recurso ao receber ordem manual
3. [ ] Inventário do robô funcionando (dicionário)
4. [ ] Armazém global (Hub) com totais
5. [ ] UI do armazém no canto da tela
6. [ ] Hub Principal na cena (construção inicial)
7. [ ] Banco de Bateria
8. [ ] Mapa procedural com spawn de recursos em raio
9. [ ] Sistema de seleção múltipla
10. [ ] Primeira construção pelo jogador (Oficina)
11. [ ] Condição de avanço de Era
