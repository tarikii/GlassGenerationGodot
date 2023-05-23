extends Node

var menu_music = preload("res://Resources/Music/LoseThose Hymns.mp3")


func _ready():
	pass


func play_musicMenu():
	if $Music.is_playing():
		pass
	else:
		$Music.stream = menu_music
		$Music.play()
		$Music.volume_db = -13.512

func stop_musicMenu():
	if $Music.is_playing():
		$Music.stop()
	else:
		pass
