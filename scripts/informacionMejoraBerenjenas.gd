extends Label

@onready var boton: mejoraBerenjena = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if boton.nivel<4:
		text = "Mejora el numero de berenjenas ganadas"
	else:
		text = "AL MAXIMO"

func _on_berenjena_mejora_mouse_entered() -> void:
	visible = true


func _on_berenjena_mejora_mouse_exited() -> void:
	visible = false
