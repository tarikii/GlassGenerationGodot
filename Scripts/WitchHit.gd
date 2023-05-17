extends Area2D

onready var health = $"../HPBarWitch"
onready var kinematic = $".."
onready var animation = $"../../WitchPlayer"

func reduce_health(damage):
	health.value -= damage
	if health.value <= 0:
		animation.play("Death " + kinematic.direction)
		




func _on_WitchPlayer_animation_finished(anim_name):
	$"..".queue_free()
