extends Node
var qtd_alimento = 0.0
@onready var mundo: Node2D = $".."
@onready var qtd = $QTD
signal gerou_alimento

func _ready() -> void:
	if mundo and mundo.has_signal("passou_uma_hora"):
		mundo.passou_uma_hora.connect(gerar_alimento)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func gerar_alimento():
	if qtd_alimento >= 12:
		print("LIMITE MÁXIMO ATINGIDO: ", name)
		return
		
	qtd_alimento += 0.5
	qtd.text = str(qtd_alimento)
	gerou_alimento.emit()
	print(name, " gerou alimento. Total: ", qtd_alimento)
