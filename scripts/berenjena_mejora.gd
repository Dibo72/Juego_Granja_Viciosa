extends Button
class_name mejoraBerenjena
@export var nivel: int = Global.berenejaMejoraNivel

@export var valor = Global.berenjenaMejoraValor

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	if nivel < 4 and Global.monedas >= valor:
		Global.monedas = Global.monedas - valor
		nivel = nivel + 1
		Global.recomAlta = Global.recomAlta + 10
		Global.recomMedia = Global.recomMedia + 7
		Global.recomBaja = Global.recomBaja + 2
		valor = valor * 4
		
		Global.berenejaMejoraNivel = nivel
		Global.berenjenaMejoraValor = valor
	
