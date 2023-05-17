extends Area2D

onready var health = $"../HPBarHuntress"
onready var kinematic = $".."
onready var animation = $"../../HuntressPlayer"

func reduce_health(damage):
	health.value -= damage
	if health.value <= 0:
		animation.play("Death " + kinematic.direction)



func _on_HuntressPlayer_animation_finished(anim_name):
	if anim_name == "Death " + kinematic.direction:
		$"..".queue_free()
