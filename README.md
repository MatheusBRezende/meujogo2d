# Meu Jogo 2D - Era da Civilização

Jogo de estratégia/gerenciamento estilo Victoria 2 / Humanity, simplificado.
O jogador guia uma vila desde a Era Paleolítica até a Era Nuclear, gerenciando
população, recursos, ciência e construções.

Projeto pessoal feito como forma de estudar e praticar programação (GDScript/Godot 4).

## Conceito Geral

- Ao apertar **M**, abre um mapa mundi com outras vilas (bloqueado até a Era 3)
- Sistema de **ciência** (forma de coleta/geração ainda em definição)
- **Comércio**: presente na Era 1, expande na Era 2 com trocas entre NPCs
- Futuramente: agricultura, geração de energia, etc.
- Progressão de Era inspirada em **Humanity**: marcos de ciência, história e
  linguagem, não apenas acúmulo de recursos

## Eras Planejadas

1. Paleolítico
2. Neolítico
3. Antiguidade
4. Industrial
5. Nuclear

## Era 1 - Paleolítico (em desenvolvimento)

**Início:** 1 cabana simples, 3 de população inicial, no meio de um mapa
aleatório (árvores, arbustos, grama).

**Coleta:** arbustos pequenos geram mirtilos/alimentos. Pedras/gravetos usados
para abater animais (alimento + peles + outros recursos).

**Construções:**
| Construção | Função | Capacidade |
|---|---|---|
| Cabana do Coletor | Coleta alimentos de arbustos | até 3 pessoas |
| Cabana do Construtor | Cria outras cabanas | até 3 pessoas |
| Cabana de Recursos | Coleta recursos numa área predefinida | até 3 pessoas |
| Hall da Inteligência | Discussão e geração de ciência | até 3 pessoas |

## Tech Stack

- Godot 4 (GDScript)
- Desenvolvido em Pop OS (Linux)

## Setup

```bash
git clone git@github.com:MatheusBRezende/meujogo2d.git
```

Abrir a pasta como projeto no Godot 4.