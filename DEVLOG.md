# Devlog

Caderno pessoal de progresso. Atualizar TODA sessão antes de fechar o Godot:
o que foi feito + qual o próximo passo.

---

## 2026-06-27

**Feito:**
- [x] Sistema de tempo funcionando (horas), independente de FPS, usando
      acumulador de `delta` com subtração (sem perda de precisão)
- [x] Interface simples (Labels) mostrando Horas e Dias em tela, atualizando
      em tempo real

**PRÓXIMO PASSO (começar por aqui na próxima sessão):**
- [ ] Adicionar minutos no relógio, formato HH:MM (usando `lpad`)

**Depois disso:**
- [ ] Sistema de NPCs com path tracing simples
      (ex: 7:00 ir pro trabalho, fome < 30 -> buscar alimento na cabana do coletor)
- [ ] Testar construção: colocar assets de teste no mapa que geram recursos,
      verificar se a soma em armazéns está correta
- [ ] Interface minimamente visual pras construções

---

## Ideias soltas (não esquecer, mas sem prioridade ainda)

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