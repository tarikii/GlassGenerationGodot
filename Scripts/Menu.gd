extends Control
var escenaJugar
var escenaInstrucciones
var escenaPuntuaciones

func _ready():
	MusicMenu.play_musicMenu()

func cambiarEscenaEmpezarPartida():
	escenaJugar = "res://Scenes/Mapa.tscn"
	get_tree().change_scene(escenaJugar)
	

func cambiarEscenaPuntuaciones():
	escenaPuntuaciones = "res://Scenes/Puntuaciones.tscn"
	get_tree().change_scene(escenaPuntuaciones)

func cambiarEscenaInstrucciones():
	escenaInstrucciones = "res://Scenes/Instrucciones.tscn"
	get_tree().change_scene(escenaInstrucciones)


func onSalirButtonPressed():
	get_tree().quit()
