# Devlog

Caderno pessoal de progresso. Atualizar TODA sessão antes de fechar o Godot:
o que foi feito + qual o próximo passo.

**Regra:** antes de adicionar qualquer coisa nova, pergunta — "isso me aproxima
de vencer a Era 1?" Se não, vai em "Ideias futuras".

---

## 2026-07-04

**Feito:**
- [x] Sistema de tempo (horas/dias), independente de FPS
- [x] UI de velocidade: botões + e - com pause/unpause
- [x] Robô se move até painel solar mais próximo livre
- [x] Robô coleta energia ao chegar no painel
- [x] Múltiplos robôs funcionando independentes (sistema `ocupado`)
- [x] Animações: idle, sleepy, noenergy
- [x] Robô para quando energia = 0

## 2026-07-08

- [x] Melhorado o sistema de tempo com pequenos ajustes
- [x] Melhorado o script de robo + adições como nome, tarefa atual e adicionado um sistema de zoom ao clicar no robo e mostrar os seus status
- [x] Adicionado uma camêra ao mundo
- [x] Desenvolvido uma UI para mostrar os status do robo

**PRÓXIMO PASSO — começar por aqui:**
- [ ] Coleta de madeira (árvore como nó simples, mesma lógica do painel solar)
- [ ] Ajuste na possibilidade de mover a camera com a roda do mouse

**Era 1 — checklist do mínimo jogável:**
- [x] Sistema de tempo
- [x] Robô coleta energia (sobrevivência básica)
- [ ] Robô coleta madeira
- [ ] Robô coleta pedra
- [ ] Armazém global (variáveis: madeira, pedra, conhecimento)
- [ ] Interface mostrando totais do armazém
- [ ] Primeira construção (Oficina ou Biblioteca — só uma por enquanto)
- [ ] Condição de avançar de Era (acumular X conhecimento)

Quando todos esses itens estiverem marcados → **Era 1 está jogável**.
Só então refatora assets, adiciona features extras, polimento visual.

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

### Era 1 — Sobrevivência (EM DESENVOLVIMENTO)

**Recursos:**
| Recurso | Como obter | Uso |
|---|---|---|
| Energia | Painéis solares | Sobrevivência do robô |
| Madeira | Árvores | Construções básicas |
| Pedra | Rochas | Construções básicas |
| Conhecimento | Biblioteca | Avançar de Era |

**Construções:**
| Construção | Função |
|---|---|
| Estação de Recarga | Robôs recarregam energia |
| Oficina | Cria novos robôs |
| Depósito de Recursos | Coleta madeira/pedra |
| Biblioteca | Gera conhecimento |

**Marco pra avançar:** acumular X conhecimento via Biblioteca.

---

### Era 2 — Reconstrução
Recursos novos: Sucata. Primeiros robôs especializados. Mapa mundi bloqueado.

### Era 3 — Sociedade
Recursos novos: Ferro. Mapa mundi desbloqueia. Biomas com recursos únicos.

### Era 4 — Industrial
Recursos novos: Aço. Fábricas automatizadas.

### Era 5 — Pós-humano
Recriar humanos. Primeiro humano = sprite feio do dev. Fim de jogo.

---

## Ideias futuras (não agora, não atrapalhar Era 1)

- Click no robô pra ver status individual
- Emojis/conversas aleatórias entre robôs
- Overstress: robô sem dormir → desliga
- Progressão visual do robô entre Eras
- Mapa procedural com FastNoiseLite
- Mapa mundi com biomas (Era 3+)
- Comércio entre colônias

---

## Decisões técnicas

- Tempo: acumulador com subtração (`segundos -= 3.5`), sem perda de delta
- Velocidade do tempo: variável `velocidade` multiplicada no delta
- Signals pra comunicação entre scripts (`passou_uma_hora`, `gerou_energia`)
- Robôs/painéis em grupos Godot pra busca dinâmica sem caminhos fixos
- Sistema `ocupado` no painel: marcado ao definir alvo, liberado ao coletar
- Animações condicionais por código, não por FPS
- Assets são placeholder — refatoração visual só após Era 1 jogável
