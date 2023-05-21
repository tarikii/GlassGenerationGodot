extends Node2D
var escenaMenu
var escenaPuntuaciones = "res://Scenes/Puntuaciones.tscn"


func _on_VolverMenu_pressed():
	escenaMenu = "res://Scenes/Menu.tscn"
	get_tree().change_scene(escenaMenu)
	
func _on_Enviar_pressed():
	Nickname.nickname = $ColorRect/TextEdit.text
	Result.result = "Lost"
	
	
	var resulta = File.new()
	resulta.open("res://Resources/Registros/resultados.txt", File.READ_WRITE)
	resulta.seek_end()
	resulta.store_string(Result.result + "\n")
	print(Result.result)
	resulta.close()
	
	var nombres = File.new()
	nombres.open("res://Resources/Registros/nombres.txt", File.READ_WRITE)
	nombres.seek_end()
	nombres.store_string(Nickname.nickname + "\n")
	print(Nickname.nickname)
	nombres.close()
	
	var puntos = File.new()
	puntos.open("res://Resources/Registros/puntuaciones.txt", File.READ_WRITE)
	puntos.seek_end()
	puntos.store_string(str(Points.points) + "\n")
	print(Points.points)
	puntos.close()
	get_tree().change_scene(escenaPuntuaciones)
