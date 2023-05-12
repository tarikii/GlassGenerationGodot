extends KinematicBody2D

export var speed = 250
onready var health = $HPBarFireWorm
var anim_player

func _ready():
	anim_player = $FireWormPlayer

func _process(delta):
	var velocity = Vector2()
	# calcular la velocidad basada en la variable de velocidad
	velocity.x += speed * delta
	# aplicar la velocidad al FireWorm
	move_and_collide(velocity)

func _on_Area2D_area_entered(hitbox):
	anim_player.play("Attack Right")
