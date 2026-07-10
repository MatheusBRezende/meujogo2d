extends Node2D

@export var tipo_recurso: String = "graveto"
@export var quantidade: int = 1

func _ready():
	add_to_group("Recursos")
