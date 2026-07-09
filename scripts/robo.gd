extends Node2D
@onready var mundo: Node2D = $".."
@onready var camera_2d: Camera2D = $"../Camera2D"
@onready var ui_robo: Control = $"../CanvasLayer/ui_robo"

var tarefa_atual = "Idle"
var velocidade = 20
var fonte_mais_proxima: Node2D = null
var energia = 100
var selecionado: bool = false
var nomes = ["BOLT", "RUST", "BYTE", "NOVA", "ECHO"]
var nome_robo = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mundo.passou_uma_hora.connect(calFome)
	mundo.passou_uma_hora.connect(dormir)
	$AnimatedSprite2D.speed_scale = 0.04
	$AnimatedSprite2D.play("idle")
	nome_robo = nomes[randi() % nomes.size()]

func dormir():
	tarefa_atual = "Parado"
	if energia <= 0:
		$AnimatedSprite2D.play("noenergy")
		tarefa_atual = "Dormindo"
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
	
	if selecionado:
		ui_robo.atualizar(self)

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
	
func locomover(delta):
	tarefa_atual = "Indo ao painel"
	if selecionado == true:
		camera_2d.global_position = global_position
	if fonte_mais_proxima != null:
		# Movimenta em direção ao painel
		global_position = global_position.move_toward(fonte_mais_proxima.global_position, mundo.velocidade * velocidade * delta)
		
		# Se chegou perto o suficiente, come
		if global_position.distance_to(fonte_mais_proxima.global_position) < 15:
			coletar_energia()

#Função  para coletar energia de painel_solar
func coletar_energia():
	tarefa_atual = "Coletando energia"
	if fonte_mais_proxima != null:	
		var energia_disponivel = fonte_mais_proxima.qtd_energia
		if energia_disponivel >= 5:
			fonte_mais_proxima.qtd_energia -= 5
			energia += 20
			fonte_mais_proxima.ocupado = false
			if energia > 100: energia = 100 
			fonte_mais_proxima = null
			
		if energia_disponivel < 5:
			fonte_mais_proxima.ocupado = false
			fonte_mais_proxima = null

func calFome():
	energia -= 5
	print("Energia: ", energia)

#Função que detecta o input do mouse esquerdo e da um zoom na camera no robo
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		if mouse_event.button_index == MOUSE_BUTTON_LEFT and mouse_event.pressed:
			ui_robo.atualizar(self)
			if selecionado == true:
				camera_2d.global_position = global_position
				camera_2d.zoom = Vector2(1.0,1.0)
				selecionado = false
				ui_robo.visible = false
			else:
				camera_2d.position = position
				camera_2d.zoom = Vector2(2.0,2.0)
				selecionado = true
				ui_robo.visible = true
