extends Node2D

var escenaMenu
onready var escenaPuntuaciones = "res://Scenes/Puntuaciones.tscn"

func _on_VolverMenu_pressed():
	escenaMenu = "res://Scenes/Menu.tscn"
	get_tree().change_scene(escenaMenu)
