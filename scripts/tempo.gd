extends Node2D
var dias = 0
var horas = 0
var segundos = 0.0
var desacumular
@onready var texthoras = get_node("Horas")
@onready var textdias = get_node("Dias")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	calTempo(delta)

func calTempo(delta:float) -> void:
	segundos += delta
	if segundos > 3.5:
		horas += 1
		if horas >= 24:
			print("ENTROU AQUI")
			dias += 1
			horas = 0
		print("Horas: ",horas)
		texthoras.text = str(horas).lpad(2,"0")
		print("Dias: ",dias)
		textdias.text = str(dias)
		segundos -= 3.5
