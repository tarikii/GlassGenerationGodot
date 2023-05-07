extends Control
var escenaMenu

func volverAlMenu():
	escenaMenu = "res://Scenes/Menu.tscn"
	get_tree().change_scene(escenaMenu)
