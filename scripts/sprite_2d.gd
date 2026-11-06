extends Node

var puntos: int = 0
@export var speed: float = 240.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func sumar_punto() -> void:
	puntos +=1
	if puntos >=5:
		print("Objetivo alcanzado")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("sumar_punto")):
		sumar_punto()
		
