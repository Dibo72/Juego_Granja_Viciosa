class_name ruleta1
extends Sprite2D

@export var juegos1: int
@export var porcentajes = [70.0, 25.0, 5.0]
@export var recompensas = [5, 15, 40]
var colores = [Color.RED, Color.GREEN, Color.BLUE]

var rng := RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("girar_ruleta") and Global.monedas >=10:
		Global.monedas-=10
			
		var eleccion = elegir_color()
		modulate=colores[eleccion]
			
		Global.monedas += recompensas[eleccion]
		juegos1 +=1


func elegir_color() -> int:
	var elegir = [0, 1, 2]
	var indice = rng.rand_weighted(porcentajes)
	return elegir[indice]
