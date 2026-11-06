extends Label

@onready var ruleta: ruleta1 = $"../Ruleta1"

func _ready() -> void:
	mostrar_porcentajes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func mostrar_porcentajes() -> void:
	text = "Rojo: " + str(ruleta.recompensas[0]) + "berenjenas\nVerde: " + str(ruleta.recompensas[1]) + "berenjenas\nAzul: " + str(ruleta.recompensas[2]) + "berenjenas"
