extends Node2D

var dias = 0
var horas = 0
var segundos = 0.0
var velocidade = 1

@onready var texthoras = get_node("Horas")
@onready var textdias = get_node("Dias")
signal passou_uma_hora

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	calTempo(delta)

# Função que simula a passagem de tempo tanto em horas quanto em dias
# Acresenta 1 dia acada 24 horas
func calTempo(delta) -> void:
	segundos += delta * velocidade
	if segundos > 3.5:
		
		segundos = 0.0
		horas += 1
		
		passou_uma_hora.emit()
		
		if horas >= 24:
			dias += 1
			horas = 0
			textdias.text = str(dias)
		
		texthoras.text = str(horas).lpad(2,"0")
		segundos -= 3.5
		

func _on_x_1_pressed() -> void:
	velocidade = 1

func _on_x_2_pressed() -> void:
	velocidade = 2

func _on_x_3_pressed() -> void:
	velocidade = 3

func _on_x_4_pressed() -> void:
	velocidade = 4

func _on_stop_pressed() -> void:
	velocidade = 0
