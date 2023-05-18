extends Control
var escenaMenu

func _ready():
	if $Fondomenu/ColorRect/VBoxNicknames/Nickname.text == "":
		$Fondomenu/ColorRect/VBoxNicknames/Nickname.text = Nickname.nickname
	else:
		pass
			
	if $Fondomenu/ColorRect/VBoxNicknames/Nickname2.text == "":
		$Fondomenu/ColorRect/VBoxNicknames/Nickname2.text = Nickname.nickname
	else:
		pass
			
	if Result.result != null:
		$Fondomenu/ColorRect/VBoxResult/Result.text = Result.result
		
	$Fondomenu/ColorRect/VBoxPoints/Points.text = str(Points.points)

func volverAlMenu():
	escenaMenu = "res://Scenes/Menu.tscn"
	get_tree().change_scene(escenaMenu)

