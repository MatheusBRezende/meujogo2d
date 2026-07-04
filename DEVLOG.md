# Devlog

Caderno pessoal de progresso. Atualizar TODA sessão antes de fechar o Godot:
o que foi feito + qual o próximo passo.

---

## 2026-07-04

**Feito:**
- [x] NPC se move fisicamente até o painel solar mais próximo (`move_toward`)
- [x] NPC só coleta energia quando chega perto o suficiente (distance_to < 15)
- [x] NPC prioriza painéis solares COM energia suficiente (filtra durante busca)
- [x] Renomeado: fome → energia, arbusto → painel solar (temática robô)
- [x] Sprites do robô criados no Piskel (spritesheet 2x2)
- [x] Animação `idle` e `dormindo` funcionando no AnimatedSprite2D
- [x] Indicador de bateria no sprite (amarelo → laranja → vermelho → vazio)
- [x] Painel solar pixel art criado
- [x] Botão x1 com pixel art
- [x] Robô dorme quando energia < 30, volta pro idle quando recarrega
- [x] Velocidade do NPC sincronizada com multiplicador de tempo (`mundo.velocidade`)
- [x] Substituído quadrado azul pelo sprite do robô na cena
- [x] Substituído nó do painel solar pelo sprite pixel art
- [x] Testado visualmente com novos assets no lugar

**PRÓXIMO PASSO — começar por aqui:**
- [ ] Testar com 2+ painéis solares e 2+ robôs independentes
- [ ] Interface mostrando energia do robô em tela (barra ou número)
- [ ] Adicionar árvores e pedras no mapa (recursos básicos Era 1)

**Depois disso:**
- [ ] Primeira construção: "Estação de Recarga"
- [ ] Mapa procedural com FastNoiseLite (árvores, pedras, painéis espalhados)

---

## Narrativa / Conceito do Jogo

**Premissa:** Um robô acorda sozinho após a extinção da humanidade. Ele
encontra livros e registros deixados pelos humanos e usa esse conhecimento
pra reconstruir a civilização — do zero, com meios rudimentares.

**Tom:** levemente engraçado, não pesado. O robô é ingênuo e determinado.
O humor vem de situações absurdas, não de piadas forçadas.

**Sacada final (Era 5):** o primeiro humano gerado pelos robôs será um
sprite feio do próprio dev — quebrando a 4ª parede com humor.

---

## Visão Geral das Eras

> Marcos de progressão: ciência/tecnologia via "livros encontrados" e
> descobertas. O robô aprende com os registros humanos.

### Era 1 — Sobrevivência (robô sozinho, recursos primitivos)

**Sensação:** tudo é difícil, o robô está se adaptando ao mundo abandonado.

**Início:** 1 robô, área limitada do mapa, painéis solares + árvores +
pedras espalhados aleatoriamente.

**Recursos:**
| Recurso | Como obter | Uso |
|---|---|---|
| Energia | Painéis solares | Sobrevivência do robô |
| Madeira | Árvores | Construções básicas |
| Pedra | Rochas | Construções básicas |
| Conhecimento | Bibliotecas/livros | Avançar de Era |

**Construções:**
| Construção | Função | Capacidade |
|---|---|---|
| Estação de Recarga | Robôs recarregam energia | até 3 robôs |
| Oficina | Cria novos robôs simples | até 3 robôs |
| Depósito de Recursos | Coleta madeira/pedra na área | até 3 robôs |
| Biblioteca | Processa livros → conhecimento | até 3 robôs |

**Marco pra avançar:** acumular X conhecimento + construir Y estruturas.

**Mapa mundi:** bloqueado.

---

### Era 2 — Reconstrução (primeiros companheiros)

**Sensação:** o robô começa a entender como os humanos funcionavam.

**Recursos novos:** Sucata do chão (coletada por robô coletor grande)

**Temas:**
- Criar robôs com funções específicas
- Robô Coletor de Sucata Grande (primeiro robô especializado)
- Produção básica de peças (não só coletar do chão)
- Comércio/troca entre grupos de robôs
- Mapa mundi ainda bloqueado

### Era 3 — Sociedade (civilização de robôs)

**Sensação:** uma "civilização" começa a tomar forma.

**Recursos novos:** Ferro (mineração básica)

**Temas:**
- Mineração de ferro
- Redes de comunicação entre robôs
- Registro de conhecimento próprio
- **Mapa mundi desbloqueia aqui** (explorar regiões com recursos únicos)

**Mapa mundi:**
- Cada região tem bioma próprio (floresta, deserto, ártico)
- Recursos exclusivos por bioma
- Robôs exploradores enviados pelo jogador
- Comércio entre colônias

### Era 4 — Industrial (escala total)

**Recursos novos:** Aço, Energia em larga escala

**Temas:**
- Fábricas de robôs automatizadas
- Geração de energia industrial
- Expansão do mapa mundi

### Era 5 — Pós-humano (fim de jogo)

**Sensação:** os robôs superaram os humanos. O que fazem com isso?

**Temas:**
- Materiais avançados, fusão nuclear
- Recriar humanos a partir do DNA encontrado nos arquivos
- **Sacada:** primeiro humano gerado = sprite feio do dev (humor + 4ª parede)
- "Vencer" = recriar a humanidade? Em aberto.

---

## Ideias soltas (não esquecer)

- Overstress: robô sem dormir por muito tempo → estresse → desliga
- Humor: robô interpreta livros humanos de forma literal/errada
- Progressão visual: robô muda de aparência entre Eras
- Cada bioma no mapa mundi tem recurso único e desafio próprio
- Comércio entre colônias no mapa mundi (Era 3+)

---

## Decisões técnicas

- Tempo: acumulador com subtração (`segundos -= 3.5`), sem perda de delta
- Nós de UI via `@onready var` no topo, não dentro de `_process`
- Velocidade do tempo: variável `velocidade` multiplicada no delta
- Signals pra comunicação entre scripts (`passou_uma_hora`, `gerou_alimento`)
- Robôs/painéis em grupos Godot pra busca dinâmica sem caminhos fixos
- NPC usa `alvo_temporario` durante busca pra não sobrescrever alvo atual
- Animações condicionais por código, não por FPS
