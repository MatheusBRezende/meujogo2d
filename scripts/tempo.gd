extends Node2D

var dias = 0
var horas = 0
var segundos = 0.0
var velocidade = 1
var velocidade_anterior = 0
@onready var textdias: Label = $CanvasLayer/Dias
@onready var texthoras: Label = $CanvasLayer/Horas
@onready var velocidade_tempo: Label = $CanvasLayer/velocidade_tempo

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
		

func _on_somar_pressed():
	if velocidade < 5:
		velocidade += 1
	atualizar_label()

func _on_diminuir_pressed():
	if velocidade > 0:
		velocidade -= 1
	atualizar_label()

func atualizar_label():
	velocidade_tempo.text = str(velocidade) + "x"

func _on_stop_pressed() -> void:
	if velocidade == 0:
		velocidade = velocidade_anterior
		velocidade_tempo.text = str(velocidade) + "x"
	else:
		velocidade_anterior = velocidade
		velocidade = 0
		velocidade_tempo.text = "Pausado"
	print("Pausado")
