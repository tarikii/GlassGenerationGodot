extends Area2D

onready var health = $"../HPBarWarrior"
onready var kinematic = $".."
onready var animation = $"../../WarriorPlayer"

func reduce_health(damage):
	health.value -= damage
	if health.value <= 0:
		animation.play("Death " + kinematic.direction)



func _on_WarriorPlayer_animation_finished(anim_name):
	if anim_name == "Death " + kinematic.direction:
		$"..".queue_free()
