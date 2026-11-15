extends CanvasLayer

signal dialogo_terminado

var _lineas: Array = []
var _indice: int = 0
var _tween: Tween

var _nombre: Label
var _texto: Label

var _estilo: StyleBoxFlat

# color del borde (y del nombre) según quién habla
var _colores := {
	"Yo": Color(1, 1, 1),                  # blanco
	"Cavernícola": Color(0.65, 0.42, 0.2), # marrón
	"Tienda": Color(0.2, 0.8, 0.3),        # verde
}


func _ready() -> void:
	layer = 100
	visible = false
	_crear_interfaz()


func _crear_interfaz() -> void:
	var panel := PanelContainer.new()
	panel.anchor_left = 0.05
	panel.anchor_right = 0.95
	panel.anchor_top = 0.68
	panel.anchor_bottom = 0.95

	var estilo := StyleBoxFlat.new()
	_estilo = estilo
	estilo.bg_color = Color(0.08, 0.06, 0.04, 0.92)
	estilo.border_color = Color(0.95, 0.8, 0.4)
	estilo.set_border_width_all(4)
	estilo.set_corner_radius_all(12)
	estilo.set_content_margin_all(16)
	panel.add_theme_stylebox_override("panel", estilo)
	add_child(panel)

	var caja := VBoxContainer.new()
	panel.add_child(caja)

	_nombre = Label.new()
	_nombre.add_theme_font_size_override("font_size", 28)
	_nombre.add_theme_color_override("font_color", Color(1, 0.85, 0.4))
	caja.add_child(_nombre)

	_texto = Label.new()
	_texto.add_theme_font_size_override("font_size", 24)
	_texto.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_texto.size_flags_vertical = Control.SIZE_EXPAND_FILL
	caja.add_child(_texto)

	var aviso := Label.new()
	aviso.text = "Espacio para continuar"
	aviso.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	aviso.add_theme_font_size_override("font_size", 16)
	caja.add_child(aviso)


# lineas = [ {"quien": "Yo", "texto": "..."}, ... ]
func mostrar(lineas: Array) -> void:
	_lineas = lineas
	_indice = 0
	Global.dialogo_activo = true
	visible = true
	_mostrar_linea()


func _mostrar_linea() -> void:
	var linea: Dictionary = _lineas[_indice]
	_nombre.text = linea["quien"]
	var color: Color = _colores.get(linea["quien"], Color(1, 0.85, 0.4))
	_estilo.border_color = color
	_nombre.add_theme_color_override("font_color", color)
	_texto.text = linea["texto"]
	_texto.visible_ratio = 0.0

	# efecto de escritura letra a letra
	_tween = create_tween()
	var duracion: float = max(0.3, linea["texto"].length() * 0.03)
	_tween.tween_property(_texto, "visible_ratio", 1.0, duracion)


func _unhandled_input(event: InputEvent) -> void:
	if not visible:
		return

	var avanzar := false
	if event is InputEventKey and event.pressed and not event.is_echo():
		if event.is_action_pressed("Interactuar") or event.is_action_pressed("ui_accept"):
			avanzar = true
	elif event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		avanzar = true

	if avanzar:
		get_viewport().set_input_as_handled()
		_avanzar()


func _avanzar() -> void:
	# si el texto aún se está escribiendo, lo completa
	if is_instance_valid(_tween) and _tween.is_running():
		_tween.kill()
		_texto.visible_ratio = 1.0
		return

	_indice += 1
	if _indice >= _lineas.size():
		_cerrar()
	else:
		_mostrar_linea()


func _cerrar() -> void:
	visible = false
	dialogo_terminado.emit()
	# esperamos un frame para que el Espacio que cierra el diálogo
	# no recoja una berenjena sin querer
	await get_tree().process_frame
	Global.dialogo_activo = false
