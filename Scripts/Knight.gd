extends KinematicBody2D

export var speed = 100
onready var health = $HPBarKnight
var anim_player

func _ready():
	anim_player = $KnightPlayer

func _process(delta):
	var velocity = Vector2()
	# calcular la velocidad basada en la variable de velocidad
	velocity.x += speed * delta
	# aplicar la velocidad al FireWorm
	move_and_collide(velocity)

func _on_Area2D_area_entered(enemyHitBox):
	var knightPlayer = get_node("../KnightPlayer")
	knightPlayer.play("Attack Right")
	speed = 0
