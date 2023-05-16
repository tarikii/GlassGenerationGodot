extends Area2D

onready var health = $"../HPBarKnight"
onready var kinematic = $".."

func reduce_health(damage):
	health.value -= damage
	if health.value <= 0:
		$"..".queue_free()
