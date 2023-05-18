extends Area2D

onready var health = $"../BaseJugador/HPBarBaseJugador"
onready var kinematic = $".."
var escenaPerdedor

func reduce_health(damage):
	health.value -= damage
	if health.value <= 0:
		$"..".queue_free()
		escenaPerdedor = "res://Scenes/Perdedor.tscn"
		get_tree().change_scene(escenaPerdedor)
