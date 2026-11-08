extends Camera2D

@export var fondo: Sprite2D

func _ready():
	var tamano = fondo.texture.get_size() * fondo.scale
	var origen = fondo.global_position

	if fondo.centered:
		origen -= tamano / 2.0

	limit_left = int(origen.x)
	limit_top = int(origen.y)
	limit_right = int(origen.x + tamano.x)
	limit_bottom = int(origen.y + tamano.y)
