extends Node2D
var escenaMenu
var primerLabelLleno = false

func _ready():
	$Fondomenu/ColorRect/VBoxNicknames/Nickname.text = ""
	$Fondomenu/ColorRect/VBoxNicknames/Nickname2.text = ""
	rellenarPuntuaciones()

func volverAlMenu():
	escenaMenu = "res://Scenes/Menu.tscn"
	get_tree().change_scene(escenaMenu)

func rellenarPuntuaciones():
	if Nickname.nickname == null:
		pass
	else:
		var nickname = Nickname.nickname
		var label1 = $Fondomenu/ColorRect/VBoxNicknames/Nickname
		var label2 = $Fondomenu/ColorRect/VBoxNicknames/Nickname2

		if label1.text == "":
			label1.text = nickname
		elif label2.text == "":
			label2.text = nickname
		else:
			label1.text = nickname

