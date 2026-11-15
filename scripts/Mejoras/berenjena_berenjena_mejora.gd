extends Button
class_name mejoraBerenjenaberenjena

var nivel: int = Global.berenejaberenjenaMejoraNivel

var valor = Global.berenjenaberenjenaMejoraValor

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
		Global.berenjenaMonedas = Global.berenjenaMonedas + 1
		valor = valor + 20
		
		Global.berenejaberenjenaMejoraNivel = nivel
		Global.berenjenaberenjenaMejoraValor = valor
