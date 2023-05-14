extends KinematicBody2D

export var speed = 300
onready var health = $HPBarHuntress
onready var damage = 150
onready var huntressPlayer = get_node("../HuntressPlayer")


func _process(delta):
	var velocity = Vector2()
	# calcular la velocidad basada en la variable de velocidad
	velocity.x += speed * delta
	# aplicar la velocidad al FireWorm
	move_and_collide(velocity)


func _on_Area2D_area_entered(enemyHitBox):
	huntressPlayer.play("Attack Right")
	attackEnemy(enemyHitBox)


func attackEnemy(enemy):
	if enemy.has_method("reduce_health"):
		enemy.reduce_health(damage)
