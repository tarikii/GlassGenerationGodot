extends KinematicBody2D

export var speed = 1800
var anim_player

func _ready():
	anim_player = $WarriorPlayer

func _process(delta):
	var velocity = Vector2()
	# calcular la velocidad basada en la variable de velocidad
	velocity.x += speed * delta
	# aplicar la velocidad al FireWorm
	move_and_slide(velocity)
	anim_player.play("Run Right")
