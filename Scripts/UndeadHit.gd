extends Area2D

onready var health = $"../HPBarUndead"
onready var kinematic = $".."
onready var animation = $"../../UndeadPlayer"

func reduce_health(damage):
	health.value -= damage
	if health.value <= 0:
		$"..".queue_free()




func _on_UndeadPlayer_animation_finished(anim_name):
	if anim_name == "Death " + kinematic.direction:
		$"..".queue_free()
