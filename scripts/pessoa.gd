extends Node2D
@onready var mundo: Node2D = $".."
@onready var arbustos = get_tree().get_nodes_in_group("Arbustos")

var arbusto_mais_proximo: Node2D = null
var fome = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mundo.passou_uma_hora.connect(calFome)
	

#Função básica para coletar alimentos de arbustos
func coletar_alimento():
	get_global_pos_arbustos()
	if arbusto_mais_proximo != null:	
		var alimento_disponivel = arbusto_mais_proximo.qtd_alimento
		if alimento_disponivel >= 5:
			arbusto_mais_proximo.qtd_alimento -= 5
			fome+=20

#Função para buscar o alimento mais próximo do npc
func get_global_pos_arbustos():
	queue_redraw()
	var pos_npc = global_position
	var menor_distancia = 500
	for pos in arbustos:
		var distancia = pos_npc.distance_to(pos.global_position)
		if menor_distancia > distancia:
			menor_distancia = distancia
			arbusto_mais_proximo = pos

func _draw() -> void:
	if arbusto_mais_proximo != null:
		# Converte a posição do arbusto para o espaço local do NPC
		var posicao_local = to_local(arbusto_mais_proximo.global_position)
		# Desenha um círculo (posição, raio, cor)
		draw_circle(posicao_local, 8, Color.YELLOW)

func calFome():
	fome-=5
	if fome < 40:
		coletar_alimento()
