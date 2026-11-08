extends Label

@onready var boton = get_parent()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if boton.nivel<4:
		text = "Nivel " + str(boton.nivel) + "\nCoste: " + str(boton.valor)
	else:
		text = "AL MAXIMO"
func _on_porcentaje_mejora_mouse_entered() -> void:
	visible = true


func _on_porcentaje_mejora_mouse_exited() -> void:
	visible = false
