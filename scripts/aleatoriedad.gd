class_name ruleta1
extends Sprite2D

@export var juegos1: int

var porcentajes = [Global.porcBaja, Global.porcMedia, Global.porcAlta]

var recompensas = [Global.recomBaja, Global.recomMedia, Global.recomAlta]
var colores = [Color.RED, Color.GREEN, Color.BLUE]

var rng := RandomNumberGenerator.new()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("girar_ruleta") and Global.monedas >= 10 and not Global.girando:
		girar()

func girar() -> void:
	var colorMostrar = 0
	Global.girando = true
	Global.monedas -= 10  # se descuenta al empezar

	var eleccion = elegir_color()  # el resultado real, decidido de antemano
	var espera := 0.25  # segundos, se reinicia en cada tirada
	var pasos := 5

	for i in range(pasos):
		#cuando se acaban los pasos:
		if i == pasos - 1:
			modulate = colores[eleccion]
		else:
			colorMostrar = cambiar_color(colorMostrar)
			modulate = colores[colorMostrar] 
			espera += 0.25
		await get_tree().create_timer(espera).timeout

	Global.monedas += recompensas[eleccion]
	juegos1 += 1
	Global.girando = false

func elegir_color() -> int:
	return rng.rand_weighted(porcentajes)
	
func cambiar_color(color: int) -> int:
	if color<2:
		return color +1
	else:
		return 0
