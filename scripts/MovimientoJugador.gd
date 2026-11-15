extends Sprite2D
class_name jugador

@export var speed: float = 5
@export var fondo: Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.dialogo_activo or Global.recolectando:
		return
		
	if Input.is_action_pressed("move_up"):
		position.y -=speed
		
	if Input.is_action_pressed("move_down"):
		position.y +=speed
		
	if Input.is_action_pressed("move_left"):
		position.x -=speed
		
	if Input.is_action_pressed("move_right"):
		position.x +=speed
