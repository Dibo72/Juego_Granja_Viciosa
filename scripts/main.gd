extends Node2D

var radio: float = 80
var dialogo

# --- recolección con barra ---
const TIEMPO_RECOLECCION: float = 2.0
var progreso: float = 0.0
var barra: ProgressBar

func _ready() -> void:
	# cuadro de diálogo (por código)
	dialogo = preload("res://scripts/dialogo.gd").new()
	add_child(dialogo)

	# barra de recolección (por código), oculta al principio
	barra = ProgressBar.new()
	barra.min_value = 0
	barra.max_value = 100
	barra.show_percentage = false
	barra.custom_minimum_size = Vector2(70, 10)
	barra.size = Vector2(70, 10)
	barra.z_index = 10
	barra.visible = false
	add_child(barra)

	# DIÁLOGO 1: al empezar el juego (solo la primera vez)
	if not Global.dialogo_inicio_visto:
		Global.dialogo_inicio_visto = true
		dialogo.mostrar([
			{"quien": "Yo", "texto": "¡Quiero recolectar berenjenas!"},
		])


func _process(delta: float) -> void:
	# mientras hay un diálogo, no se hace nada más
	if Global.dialogo_activo:
		return

	# mientras se recolecta: se rellena la barra y no se hace nada más
	if Global.recolectando:
		progreso += delta
		barra.value = progreso / TIEMPO_RECOLECCION * 100.0
		barra.position = $Jugador.position + Vector2(-35, -60)
		if progreso >= TIEMPO_RECOLECCION:
			Global.monedas += Global.berenjenaMonedas
			Global.recolectando = false
			barra.visible = false
		return

	# DIÁLOGO 2: al llegar a 10 berenjenas (solo una vez)
	if Global.monedas >= 10 and not Global.dialogo_10_visto:
		Global.dialogo_10_visto = true
		dialogo.mostrar([
			{"quien": "Cavernícola", "texto": "¡Vaya, qué bien huelen esas berenjenas!"},
			{"quien": "Yo", "texto": "¿Tú crees? Llevo ya 10 recogidas."},
			{"quien": "Cavernícola", "texto": "Hay un dragón al que le encantan las berenjenas. Si se las llevas, puede darte recompensas a cambio."},
			{"quien": "Yo", "texto": "¿Un dragón? ¡Eso suena genial!"},
			{"quien": "Tienda", "texto": "¡Aquí se puede mejorar eso!!"},
		])
		return

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
	
	# al pulsar Espacio cerca de la berenjena: empieza la recolección
	if distanceBerenjena <= radio and Input.is_action_just_pressed("Interactuar"):
		Global.recolectando = true
		progreso = 0.0
		barra.value = 0
		barra.position = $Jugador.position + Vector2(-35, -60)
		barra.visible = true
