extends Node

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var robos = get_tree().get_nodes_in_group("Robos")
			for robo in robos:
				robo.desselecionar()
