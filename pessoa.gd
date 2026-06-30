extends Node2D
@onready var arbusto: Node2D = $"../arbusto"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	arbusto.gerou_alimento.connect(coletar_alimento)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func coletar_alimento():
	var alimento = arbusto.qtd_alimento
	if alimento >= 5:
		arbusto.qtd_alimento -= 5
