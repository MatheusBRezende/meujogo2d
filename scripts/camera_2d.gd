extends Camera2D
var arrastando:bool

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		#Zoom para "dentro"
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and zoom.x < 10:
			zoom += Vector2(0.1,0.1)
			zoom = zoom.clamp(Vector2(1.0, 1.0), Vector2(10.0, 10.0))
		#Zoom para "fora"
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and zoom.x >= 1 :
			zoom -= Vector2(0.1,0.1)
			zoom = zoom.clamp(Vector2(1.0, 1.0), Vector2(10.0, 10.0))

		if event.button_index == MOUSE_BUTTON_MIDDLE:
			arrastando = event.pressed
			
	if arrastando and event is InputEventMouseMotion:
		position -= event.relative
		position = position.clamp(Vector2(-500 , -500),Vector2(1500, 1500))
