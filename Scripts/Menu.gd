extends Control
var escenaJugar
var escenaPuntuaciones

func cambiarEscenaEmpezarPartida():
	escenaJugar = "res://Scenes/Mapa.tscn"
	get_tree().change_scene(escenaJugar)
	

func cambiarEscenaPuntuaciones():
	escenaPuntuaciones = "res://Scenes/Puntuaciones.tscn"
	get_tree().change_scene(escenaPuntuaciones)


func onSalirButtonPressed():
	get_tree().quit()
