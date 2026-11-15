extends Node2D

@onready var categorias = {
	"berejena": $MejoraBerenjena,
	#"mina": $MejoraMina,
	#"pesca": $MejoraPesca,
}

func _ready():
	pass

func mostrar_categoria(cat: String):
	for nombre in categorias:
		categorias[nombre].visible = (nombre == cat)


func _on_button_berenjena_pressed() -> void:
	invisible()
	$MejoraBerenjena.visible = true
	



func _on_button_mina_pressed() -> void:
	invisible()
	$MejoraMina.visible = true
	
func invisible():
	$MejoraBerenjena.visible = false
	$MejoraMina.visible = false
