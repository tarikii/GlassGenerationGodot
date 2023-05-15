extends KinematicBody2D

export var speed = 150
onready var health = $HPBarGoblin
onready var damage = 100
onready var goblinPlayer = get_node("../GoblinPlayer")
onready var attacking = false
var currentEnemyHitBox = null
var attackCharactersList = []


func _process(delta):
	var velocity = Vector2()
	# calcular la velocidad basada en la variable de velocidad
	velocity.x += speed * delta
	# aplicar la velocidad al FireWorm
	move_and_collide(velocity)


func _on_Area2D_area_entered(enemyHitBox):
	if !attacking:
		goblinPlayer.play("Attack Right")
		attacking = true
		if currentEnemyHitBox != null:
			attackCharactersList.append(currentEnemyHitBox)
		currentEnemyHitBox = enemyHitBox
		if currentEnemyHitBox != null:
			attackEnemy(currentEnemyHitBox)

func _on_Area2D_area_exited(enemyHitBox):
	if currentEnemyHitBox == enemyHitBox:
		currentEnemyHitBox = null
		attacking = false
		goblinPlayer.play("Run Right")
	if attackCharactersList.has(enemyHitBox):
		attackCharactersList.erase(enemyHitBox)


func attackEnemy(enemy):
	if(is_instance_valid(enemy)):
		if enemy.has_method("reduce_health"):
			enemy.reduce_health(damage)
	else:
		attacking = false
		goblinPlayer.play("Run Right")

func _on_GoblinPlayer_animation_started(anim_name):
	if anim_name == "Attack Right" and currentEnemyHitBox != null:
		attackEnemy(currentEnemyHitBox)

func _on_GoblinPlayer_animation_finished(anim_name):
	if anim_name == "Attack Right":
		goblinPlayer.play("Attack Right")
		attacking = false
