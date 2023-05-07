extends KinematicBody2D

const SPEED = 100
var motion = Vector2()
onready var animation = $SkeletonPlayer

func _physics_process(delta):
	motion = move_and_slide(motion)

func _process(delta):
	animation.play("Attack Right")
