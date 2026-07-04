extends Node2D
@onready var mundo: Node2D = $".."
var velocidade = 20
var fonte_mais_proxima: Node2D = null
var energia = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mundo.passou_uma_hora.connect(calFome)
	mundo.passou_uma_hora.connect(dormir)
	$AnimatedSprite2D.speed_scale = 0.04
	$AnimatedSprite2D.play("idle")

func dormir():
	if energia <= 0:
		$AnimatedSprite2D.play("noenergy")
		return
	elif energia <= 30 and $AnimatedSprite2D.animation != "sleepy":
		$AnimatedSprite2D.play("sleepy")
	elif energia > 30 and $AnimatedSprite2D.animation != "idle":
		$AnimatedSprite2D.play("idle")

	

func _physics_process(delta: float) -> void:
	if energia <= 40:
		if fonte_mais_proxima == null:
			atualizar_fonte_mais_proxima()
		locomover(delta)
	else:
		fonte_mais_proxima = null
		queue_redraw()

	
func atualizar_fonte_mais_proxima():
	var painel_solar = get_tree().get_nodes_in_group("Fonte")
	print(name, " encontrou ", painel_solar.size(), " fontes")
	#Se não existirem painel_solar no jogo cancela
	if painel_solar.size() == 0:
		fonte_mais_proxima = null
		return
	var pos_npc = global_position
	var menor_distancia = 999999
	var alvo_temporario: Node2D = null
	
	for painel in painel_solar:
		if painel.qtd_energia >= 5 && painel.ocupado != true:
			var distancia = pos_npc.distance_to(painel.global_position)
			if distancia < menor_distancia :
				menor_distancia = distancia
				alvo_temporario = painel
				
	fonte_mais_proxima = alvo_temporario
	
	queue_redraw()
	
func locomover(delta):
	if fonte_mais_proxima != null:
		# Movimenta em direção ao painel
		print(name, " distancia: ", global_position.distance_to(fonte_mais_proxima.global_position))
		global_position = global_position.move_toward(fonte_mais_proxima.global_position, mundo.velocidade * velocidade * delta)
		
		# Se chegou perto o suficiente, come
		if global_position.distance_to(fonte_mais_proxima.global_position) < 15:
			coletar_energia()
			
#Função  para coletar alimentos de painel_solar
func coletar_energia():
	if fonte_mais_proxima != null:	
		var energia_disponivel = fonte_mais_proxima.qtd_energia
		if energia_disponivel >= 5:
			fonte_mais_proxima.qtd_energia -= 5
			energia += 20
			fonte_mais_proxima.ocupado = false
			if energia > 100: energia = 100 
			print("Recarregando : ", energia)
			fonte_mais_proxima = null
			
		if energia_disponivel < 5:
			print("ENTROU")
			fonte_mais_proxima.ocupado = false
			fonte_mais_proxima = null
			
func _draw() -> void:
	if fonte_mais_proxima != null:
		var posicao_local = to_local(fonte_mais_proxima.global_position)
		draw_circle(posicao_local, 8, Color.YELLOW)

func calFome():
	energia -= 5
	print("Energia: ", energia)
