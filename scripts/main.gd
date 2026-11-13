extends Node2D

var radio: float = 80

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.cueva1:
		var distanceRuleta1: float = $Jugador.global_position.distance_to(
			$Cueva1.global_position
		)
		
		var distanceRuleta2: float = $Jugador.global_position.distance_to(
			$Cueva2.global_position
		)
		
		var distanceRuleta3: float = $Jugador.global_position.distance_to(
			$Cueva3.global_position
		)
		
		if distanceRuleta1 <= radio:
			get_tree().change_scene_to_file("res://scenes/levels/Ruleta.tscn")
			
		if distanceRuleta2 <= radio:
			get_tree().change_scene_to_file("res://scenes/levels/Mina.tscn")

		var distanceTienda: float = $Jugador.global_position.distance_to(
			$Tienda.global_position
		)
		
		if distanceTienda <= radio:
			get_tree().change_scene_to_file("res://scenes/levels/Tienda.tscn")
		
	var distanceBerenjena: float = $Jugador.global_position.distance_to(
		$Berenjena.global_position
	)
	
	if distanceBerenjena <= radio and Input.is_action_just_pressed("Interactuar"):
		Global.monedas += 1
		
