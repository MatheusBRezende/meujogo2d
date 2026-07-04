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
- [x] Animação `idle`, `sleepy` e `noenergy` funcionando
- [x] Indicador de bateria no sprite (amarelo → laranja → vermelho → vazio)
- [x] Painel solar pixel art criado
- [x] Robô dorme quando energia < 30, volta pro idle quando recarrega
- [x] Robô para de se mover quando energia = 0
- [x] Velocidade do NPC sincronizada com multiplicador de tempo
- [x] Substituído quadrado azul pelo sprite do robô na cena
- [x] Testado com 2+ robôs e 2+ painéis — cada um vai pro mais próximo livre
- [x] Sistema de `ocupado` no painel pra evitar dois robôs no mesmo alvo
- [x] UI de velocidade reformulada: botões + e - com label mostrando "2x"
- [x] Botão pause/unpause restaura velocidade anterior corretamente

**PRÓXIMO PASSO — amanhã começar por aqui:**
- [ ] Interface mostrando energia de cada robô em tela (barra ou número)
      Dica: ProgressBar ou Label acima do sprite do robô

**Depois disso (foco em funcionalidades, assets depois):**
- [ ] Sistema de coleta de madeira (árvore como nó simples, sem asset bonito)
- [ ] Sistema de coleta de pedra (mesma lógica da madeira)
- [ ] Armazém global de recursos (madeira, pedra, energia acumulada)
- [ ] Primeira construção: "Estação de Recarga" (placeholder geométrico)
- [ ] Mapa procedural com FastNoiseLite

---

## Decisão de desenvolvimento

**Assets depois, funcionalidade agora.** O jogo vai rodar com quadrados e
círculos coloridos até os sistemas estarem prontos. Refatoração visual
completa só quando a Era 1 estiver jogável do início ao fim.

---

## Narrativa / Conceito do Jogo

**Premissa:** Um robô acorda sozinho após a extinção da humanidade. Ele
encontra livros e registros deixados pelos humanos e usa esse conhecimento
pra reconstruir a civilização — do zero, com meios rudimentares.

**Tom:** levemente engraçado, não pesado. O robô é ingênuo e determinado.

**Sacada final (Era 5):** o primeiro humano gerado pelos robôs será um
sprite feio do próprio dev — quebrando a 4ª parede com humor.

---

## Visão Geral das Eras

> Marcos de progressão: ciência/tecnologia via "livros encontrados" e
> descobertas. O robô aprende com os registros humanos.

### Era 1 — Sobrevivência (robô sozinho, recursos primitivos)

**Sensação:** tudo é difícil, o robô está se adaptando ao mundo abandonado.

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

**Recursos novos:** Sucata do chão

**Temas:**
- Criar robôs com funções específicas
- Robô Coletor de Sucata Grande (primeiro robô especializado)
- Comércio/troca entre grupos de robôs
- Mapa mundi ainda bloqueado

### Era 3 — Sociedade (civilização de robôs)

**Recursos novos:** Ferro (mineração básica)

**Temas:**
- Mineração de ferro, redes de comunicação
- **Mapa mundi desbloqueia aqui**
- Cada região: bioma próprio, recursos exclusivos, comércio entre colônias

### Era 4 — Industrial

**Recursos novos:** Aço, energia em larga escala

**Temas:** Fábricas automatizadas, expansão do mapa mundi

### Era 5 — Pós-humano (fim de jogo)

**Temas:**
- Recriar humanos a partir de DNA nos arquivos
- **Sacada:** primeiro humano = sprite feio do dev (humor + 4ª parede)
- "Vencer" = recriar a humanidade? Em aberto.

---

## Ideias soltas (não esquecer)

- Overstress: robô sem dormir → estresse → desliga
- Humor: robô interpreta livros humanos de forma literal/errada
- Progressão visual: robô muda de aparência entre Eras
- Cada bioma no mapa mundi tem recurso único e desafio próprio

---

## Decisões técnicas

- Tempo: acumulador com subtração (`segundos -= 3.5`), sem perda de delta
- Nós de UI via `@onready var` no topo, não dentro de `_process`
- Velocidade do tempo: variável `velocidade` multiplicada no delta
- Signals pra comunicação entre scripts (`passou_uma_hora`, `gerou_energia`)
- Robôs/painéis em grupos Godot pra busca dinâmica sem caminhos fixos
- NPC usa `alvo_temporario` durante busca pra não sobrescrever alvo atual
- Animações condicionais por código, não por FPS
- Sistema `ocupado` no painel: marcado ao definir alvo, liberado ao coletar
