extends Control
var escenaJugar
var escenaInstrucciones

func cambiarEscenaEmpezarPartida():
	escenaJugar = "res://Scenes/Mapa.tscn"
	get_tree().change_scene(escenaJugar)
	

func cambiarEscenaPuntuaciones():
	escenaInstrucciones = "res://Scenes/Instrucciones.tscn"
	get_tree().change_scene(escenaInstrucciones)


func onSalirButtonPressed():
	get_tree().quit()
