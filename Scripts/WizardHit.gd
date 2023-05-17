extends Area2D

onready var health = $"../HPBarWizard"
onready var kinematic = $".."
onready var animation = $"../../WizardPlayer"

func reduce_health(damage):
	health.value -= damage
	if health.value <= 0:
		animation.play("Death " + kinematic.direction)



func _on_WizardPlayer_animation_finished(anim_name):
	$"..".queue_free()
