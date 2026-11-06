extends Node2D

var radio: float = 80

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var distance: float = $Jugador.global_position.distance_to(
		$Cueva1.global_position
	)
	
	if distance <= radio:
		get_tree().change_scene_to_file("res://scenes/levels/Ruleta.tscn")
