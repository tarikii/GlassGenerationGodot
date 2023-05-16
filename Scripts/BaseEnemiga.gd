extends Area2D

export var max_health = 2000
onready var health = $"../BaseEnemiga/HPBarEstructuraEnemiga"
onready var kinematic = $".."

func reduce_health(damage):
	health.value -= damage
	if health.value <= 0:
		$"..".queue_free()
