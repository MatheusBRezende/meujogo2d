# Devlog

Caderno pessoal de progresso. Atualizar TODA sessão antes de fechar o Godot:
o que foi feito + qual o próximo passo.

---

## 2026-06-30

**Feito:**
- [x] Sistema de tempo funcionando (horas/dias), independente de FPS
- [x] Interface simples (Labels) mostrando Horas e Dias em tela
- [x] Git + SSH configurados (push sem precisar digitar senha toda vez)
- [x] Botão de acelerar tempo (x1, x2, x3, x4, stop) via variável `velocidade`
- [x] Arbusto gerando +0.5 alimento por hora via signal `passou_uma_hora`
- [x] Limite máximo de alimento no arbusto (12 unidades)
- [x] NPC com variável `fome` que diminui por hora
- [x] NPC identifica o arbusto mais próximo usando grupos + `distance_to`
- [x] NPC coleta automaticamente quando fome < 40 e arbusto tem >= 5 unidades
- [x] Visualização do arbusto mais próximo com círculo amarelo (`_draw`)

**Decisão:** não vai ter minutos no relógio por enquanto. A velocidade atual
dos dias está num ritmo bom. Pode revisitar depois se sentir necessidade.

**Decisão técnica:** o NPC ainda não se move fisicamente — ele identifica
e coleta instantaneamente. Isso é "lógica de decisão", não path tracing.
Path tracing (movimento real) vem no próximo passo.

**Bug conhecido pra corrigir:**
- [x] `gerou_alimento.emit()` dispara mesmo quando limite foi atingido e
	  nenhum alimento foi gerado — mover o emit pra depois do `return`

**PRÓXIMO PASSO — amanhã começar por aqui:**
- [ ] Fazer o NPC se mover fisicamente até o arbusto mais próximo antes
	  de coletar (pesquisar: "Godot move_toward" e "Godot NavigationAgent2D")
	  Sugestão: começa com `move_toward` (mais simples, sem obstáculos),
	  só migra pra NavigationAgent2D se sentir necessidade de desviar de
	  paredes/construções

**Depois disso:**
- [ ] Interface mostrando fome do NPC em tela (Label ou barra)
- [ ] Testar com 2+ arbustos e 2+ NPCs pra ver se cada um vai pro mais próximo
- [ ] Interface minimamente visual pras construções

---

## Visão Geral das Eras

> Marcos de progressão: por enquanto a ideia é ciência/tecnologia
> (ex: descobrir o fogo, criar uma ferramenta específica). Cultura/sociedade
> pode entrar mais pra frente, mas ainda não está definido.

### Era 1 — Paleolítico (DETALHADA, é a que está em desenvolvimento)

**Sensação que quero:** sobrevivência, tudo é difícil, o jogador sente que
está começando do zero.

**Início:** 1 cabana simples, 3 de população inicial, num mapa aleatório
cheio de árvores, arbustos e grama.

**Recursos:**
- Alimento (mirtilos, coletados de arbustos pequenos)
- Pedras / gravetos (usados pra caçar animais)
- Peles e outros recursos de caça

**Ações do jogador:**
- Coletar de arbustos (alimento, 2 por pessoa)
- Caçar animais com pedras/gravetos (alimento + peles)
- Construir cabanas novas (estilo Cities Skylines)

**Construções:**
| Construção | Função | Capacidade |
|---|---|---|
| Cabana do Coletor | Coleta alimentos de arbustos | até 3 pessoas |
| Cabana do Construtor | Cria outras cabanas | até 3 pessoas |
| Cabana de Recursos | Coleta recursos numa área predefinida | até 3 pessoas |
| Hall da Inteligência | Discussão e geração de ciência | até 3 pessoas |

**Mapa mundi (tecla M):** bloqueado, não existe ainda nessa Era.

**Comércio:** existe, mas ainda não definido como funciona na prática.

**Marco pra avançar de Era:** ainda não definido (provavelmente ligado a
descobrir o fogo e/ou ferramentas melhores).

---

### Era 2 — Neolítico (DIREÇÃO GERAL, ainda não detalhada)

**Sensação que quero pensar:** a vila para de só sobreviver e começa a se
fixar/organizar — primeira sensação de "civilização".

**Temas pra explorar quando chegar a hora:**
- Agricultura (plantar em vez de só coletar)
- Domesticação de animais
- Comércio evolui: trocas entre NPCs (ainda não dinheiro)
- Mapa mundi continua bloqueado

### Era 3 — Antiguidade (DIREÇÃO GERAL, ainda não detalhada)

**Sensação que quero pensar:** a vila vira algo maior, com identidade —
comércio organizado, primeiras formas de registro/escrita.

**Temas pra explorar quando chegar a hora:**
- Comércio mais estruturado (possivelmente moeda/trocas formais)
- Escrita / registro de conhecimento
- Mapa mundi (tecla M) provavelmente desbloqueia aqui

### Era 4 — Industrial (DIREÇÃO GERAL, ainda não detalhada)

**Sensação que quero pensar:** salto de escala — produção em massa, a vila
vira algo parecido com uma cidade pequena.

**Temas pra explorar quando chegar a hora:**
- Geração de energia
- Produção em massa / fábricas
- Big jump na população e complexidade de construções

### Era 5 — Nuclear (DIREÇÃO GERAL, ainda não detalhada)

**Sensação que quero pensar:** auge tecnológico, ciência no centro de tudo —
é o "fim de jogo".

**Temas pra explorar quando chegar a hora:**
- Ciência avançada como foco principal
- Energia nuclear
- O que significa "vencer" o jogo nessa Era ainda é uma pergunta em aberto

---

## Ideias soltas (não esquecer, mas sem prioridade ainda)

- Comércio entre NPCs já na Era 1, expande na Era 2
- Sistema de ciência: ainda não decidido como será a coleta/geração
- Mapa mundi (tecla M): só desbloqueia a partir da Era 3
- Progressão de Era estilo Humanity: marcos de ciência/história/linguagem,
  não só "encher uma barrinha de recurso"

---

## Decisões técnicas (pra não esquecer o "porquê")

- Tempo: usa acumulador com subtração (`segundos -= 3.5`) em vez de zerar,
  pra não perder a sobra de delta entre frames
- Nós de UI acessados via `@onready var` no topo do script, não dentro de
  `_process`, pra não ficar buscando o nó toda hora
- Velocidade do tempo: variável `velocidade` multiplicada no delta dentro de
  `calTempo`, não altera o delta original do Godot
- Signals usados pra comunicação entre scripts (ex: `passou_uma_hora`,
  `gerou_alimento`) em vez de checar variáveis todo frame no `_process`
- Arbustos adicionados a um grupo ("Arbustos") pra NPC achar todos via
  `get_tree().get_nodes_in_group()` sem caminhos fixos
