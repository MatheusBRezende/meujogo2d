extends Node
var qtd_alimento = 0.0
@onready var mundo: Node2D = $".."
@onready var qtd: Label = $"../QTD"
signal gerou_alimento

func _ready() -> void:
	mundo.passou_uma_hora.connect(gerar_alimento)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func gerar_alimento():
	if qtd_alimento >= 12:
		print("LIMITE MÁXIMO ATINGIDO")
		return
	gerou_alimento.emit()
		
	print("LIMITE LIBERADO")
	qtd_alimento += 0.5
	qtd.text = str(qtd_alimento)
