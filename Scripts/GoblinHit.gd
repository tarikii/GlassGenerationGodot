extends Area2D

onready var health = $"../HPBarGoblin"
onready var kinematic = $".."
onready var animation = $"../../GoblinPlayer"

func reduce_health(damage):
	health.value -= damage
	if health.value <= 0:
		animation.play("Death " + kinematic.direction)




func _on_GoblinPlayer_animation_finished(anim_name):
	if anim_name == "Death " + kinematic.direction:
		$"..".queue_free()
