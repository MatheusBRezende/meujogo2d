extends Node2D
@onready var mundo: Node2D = $".."
var velocidade = 20
var arbusto_mais_proximo: Node2D = null
var fome = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mundo.passou_uma_hora.connect(calFome)

func _physics_process(delta: float) -> void:
	if fome <= 40:
		atualizar_arbusto_mais_proximo()
		if arbusto_mais_proximo != null:
			locomover(delta)
	else:
		arbusto_mais_proximo = null
		queue_redraw()
	pass
	
func atualizar_arbusto_mais_proximo():
	var arbustos = get_tree().get_nodes_in_group("Arbustos")
	#Se não existirem arbustos no jogo cancela
	if arbustos.size() == 0:
		arbusto_mais_proximo = null
		return
	var pos_npc = global_position
	var menor_distancia = 999999
	var alvo_temporario: Node2D = null
	
	for arbusto in arbustos:
		if arbusto.qtd_alimento >= 5:
			var distancia = pos_npc.distance_to(arbusto.global_position)
			if distancia < menor_distancia:
				menor_distancia = distancia
				alvo_temporario = arbusto
				
	arbusto_mais_proximo = alvo_temporario
	queue_redraw()
	

func locomover(delta):
	if arbusto_mais_proximo != null:
		# Movimenta em direção ao arbusto
		global_position = global_position.move_toward(arbusto_mais_proximo.global_position, mundo.velocidade * velocidade * delta)
		
		# Se chegou perto o suficiente, come
		if global_position.distance_to(arbusto_mais_proximo.global_position) < 15:
			coletar_alimento()
			
#Função  para coletar alimentos de arbustos
func coletar_alimento():
	if arbusto_mais_proximo != null:	
		var alimento_disponivel = arbusto_mais_proximo.qtd_alimento
		if alimento_disponivel >= 5:
			arbusto_mais_proximo.qtd_alimento -= 5
			fome += 20
			if fome > 100: fome = 100 
			print("Comendo. Fome atual: ", fome)

			arbusto_mais_proximo = null
			
func _draw() -> void:
	if arbusto_mais_proximo != null:
		var posicao_local = to_local(arbusto_mais_proximo.global_position)
		draw_circle(posicao_local, 8, Color.YELLOW)

func calFome():
	fome -= 5
	print("Fome diminuiu: ", fome)
