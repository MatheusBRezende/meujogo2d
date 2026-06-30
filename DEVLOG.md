# Devlog

Caderno pessoal de progresso. Atualizar TODA sessão antes de fechar o Godot:
o que foi feito + qual o próximo passo.

---

## 2026-06-30

**Feito:**
- [x] Sistema de tempo funcionando (horas), independente de FPS, usando
	  acumulador de `delta` com subtração (sem perda de precisão)
- [x] Interface simples (Labels) mostrando Horas e Dias em tela, atualizando
	  em tempo real
- [x] Git + SSH configurados (push sem precisar digitar senha toda vez)

**Decisão:** não vai ter minutos no relógio por enquanto. A velocidade atual
dos dias (1 dia a cada X segundos reais) já está num ritmo bom, nem rápido
nem lento demais. Pode revisitar isso depois se sentir necessidade.

**PRÓXIMO PASSO (começar por aqui na próxima sessão):**
- [x] Botão/tecla pra acelerar o tempo (ex: 1x, 2x, 4x), multiplicando o
	  `delta` antes de passar pro `calTempo`

**Depois disso:**
- [ ] Sistema de NPCs com path tracing simples
	  (ex: 7:00 ir pro trabalho, fome < 30 -> buscar alimento na cabana do coletor)
- [ ] Testar construção: colocar assets de teste no mapa que geram recursos,
	  verificar se a soma em armazéns está correta
- [ ] Interface minimamente visual pras construções

---

## Visão Geral das Eras

> Marcos de progressão: por enquanto a ideia é ciência/tecnologia
> (ex: descobrir o fogo, criar uma ferramenta específica). Cultura/sociedade
> pode entrar mais pra frente, mas ainda não está definido — não travar nisso
> agora, só ter em mente que pode crescer.

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
- Coletar de arbustos (alimento) 2 por pessoa
- Caçar animais com pedras/gravetos (alimento + peles)
- Construir cabanas novas (estilo ferramenta de construção de Cities Skylines)

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
descobrir o fogo e/ou ferramentas melhores — pensar nisso quando a Era 1
estiver jogável).

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
- Provavelmente big jump na população e complexidade de construções

### Era 5 — Nuclear (DIREÇÃO GERAL, ainda não detalhada)

**Sensação que quero pensar:** auge tecnológico, ciência no centro de tudo —
é o "fim de jogo".

**Temas pra explorar quando chegar a hora:**
- Ciência avançada como foco principal
- Energia nuclear
- O que significa "vencer" ou "terminar" o jogo nessa Era ainda é uma pergunta
  em aberto

---

- Comércio entre NPCs já na Era 1, expande na Era 2
- Sistema de ciência: ainda não decidido como será a coleta/geração
- Mapa mundi (tecla M): só desbloqueia a partir da Era 3
- Progressão de Era estilo Humanity: marcos de ciência/história/linguagem,
  não só "encher uma barrinha de recurso"

---

## Decisões técnicas (pra não esquecer o "porquê")

- Tempo: usa acumulador com subtração (`segundos -= 1`) em vez de zerar
  (`segundos = 0`), pra não perder a sobra de delta entre frames
- Nós de UI acessados via `@onready var` no topo do script, não dentro de
  `_process`, pra não ficar buscando o nó toda hora
