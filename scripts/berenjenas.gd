extends Sprite2D

#var jugador_cerca: bool = false

func _ready() -> void:
	pass
	#body_entered.connect(_on_body_entered)
	#body_exited.connect(_on_body_exited)

#func _on_body_entered(body: jugador) -> void:
	#if body.is_in_group("jugador"):
		#jugador_cerca = true
#
#func _on_body_exited(body: jugador) -> void:
	#if body.is_in_group("jugador"):
		#jugador_cerca = false

func _process(_delta: float) -> void:
	#if jugador_cerca and Input.is_action_just_pressed("Interactuar"):
	if Input.is_action_just_pressed("Interactuar"):
		accion()

func accion() -> void:
	Global.monedas += 1
	print(Global.monedas)
	
