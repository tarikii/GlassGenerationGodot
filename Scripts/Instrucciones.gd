extends Node2D
var escenaMenu

func volverAlMenu():
	escenaMenu = "res://Scenes/Menu.tscn"
	get_tree().change_scene(escenaMenu)
