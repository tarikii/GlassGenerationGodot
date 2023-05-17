extends Node2D
var escenaMenu



func _on_VolverMenu_pressed():
	escenaMenu = "res://Scenes/Menu.tscn"
	get_tree().change_scene(escenaMenu)
