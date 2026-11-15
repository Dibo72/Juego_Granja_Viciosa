extends Node

var dialogo_activo := false
var dialogo_inicio_visto := false
var dialogo_10_visto := false
var recolectando := false

var monedas = 0
var juegos1: int

var porcMedia =32.0
var porcAlta=10.0
var porcBaja: float:
	#ponemos el get para que se recalcule siempre
	get:
		return 100.0 - porcMedia - porcAlta

var recomMedia = 15
var recomAlta=40
var recomBaja = 5

var girando := false

var berenejaMejoraNivel = 0
var berenjenaMejoraValor = 30

var berenejaberenjenaMejoraNivel = 0
var berenjenaberenjenaMejoraValor = 10
var berenjenaMonedas = 1

var porcentajeMejoraNivel = 0
var porcentajeMejoraValor = 100

var cueva1= false
var cueva2= false
var cueva3=false

func _process(delta: float) -> void:
	if monedas>=10:
		cueva1 = true
	if monedas >= 500:
		cueva2= true
	if monedas >= 5000:
		cueva3= true
