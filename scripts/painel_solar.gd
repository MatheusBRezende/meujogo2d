extends Node2D
var qtd_energia = 0.0
@onready var mundo: Node2D = $".."
@onready var qtd: Label = $qtd
var ocupado = false

signal gerou_energia

func _ready() -> void:
	if mundo and mundo.has_signal("passou_uma_hora"):
		mundo.passou_uma_hora.connect(gerar_energia)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func gerar_energia():
	if qtd_energia >= 12:
		print("LIMITE MÁXIMO ATINGIDO: ", name)
		return
		
	qtd_energia += 0.5
	qtd.text = str(qtd_energia)
	gerou_energia.emit()
	print(name, " gerou energia. Total: ", qtd_energia)
