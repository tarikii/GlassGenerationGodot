extends KinematicBody2D

export var speed = 150
onready var damage = 100
onready var goblinPlayer = get_node("../GoblinPlayer")
onready var attacking = false
var currentEnemyHitBox = null
var attackCharactersList = []


func _process(delta):
	var velocity = Vector2()
	if goblinPlayer.get_current_animation() == "Run Right":
		# calcular la velocidad basada en la variable de velocidad
		velocity.x += speed * delta
	elif goblinPlayer.get_current_animation() == "Run Left":
		# calcular la velocidad basada en la variable de velocidad
		velocity.x -= speed * delta
	# aplicar la velocidad al FireWorm
	move_and_collide(velocity)


func _on_Area2D_area_entered(enemyHitBox):
	if !attacking:
		if enemyHitBox.is_in_group("PlayerCharacters"):
			goblinPlayer.play("Attack Right")
			attacking = true
			if currentEnemyHitBox != null:
				attackCharactersList.append(currentEnemyHitBox)
			currentEnemyHitBox = enemyHitBox
			if currentEnemyHitBox != null:
				attackEnemy(currentEnemyHitBox)
		elif enemyHitBox.is_in_group("IACharacters"):
			goblinPlayer.play("Attack Left")
			attacking = true
			if currentEnemyHitBox != null:
				attackCharactersList.append(currentEnemyHitBox)
			currentEnemyHitBox = enemyHitBox
			if currentEnemyHitBox != null:
				attackEnemy(currentEnemyHitBox)

func _on_Area2D_area_exited(enemyHitBox):
	if enemyHitBox.is_in_group("PlayerCharacters"):
		if currentEnemyHitBox == enemyHitBox:
			currentEnemyHitBox = null
			attacking = false
			goblinPlayer.play("Run Left")
		if attackCharactersList.has(enemyHitBox):
			attackCharactersList.erase(enemyHitBox)
	elif enemyHitBox.is_in_group("IACharacters"):
		if currentEnemyHitBox == enemyHitBox:
			currentEnemyHitBox = null
			attacking = false
			goblinPlayer.play("Run Right")
		if attackCharactersList.has(enemyHitBox):
			attackCharactersList.erase(enemyHitBox)


func attackEnemy(enemy):
	if enemy.is_in_group("PlayerCharacters"):
		if(is_instance_valid(enemy)):
			if enemy.has_method("reduce_health"):
				enemy.reduce_health(damage)
		else:
			attacking = false
			goblinPlayer.play("Run Left")
	elif enemy.is_in_group("IACharacters"):
		if(is_instance_valid(enemy)):
			if enemy.has_method("reduce_health"):
				enemy.reduce_health(damage)
		else:
			attacking = false
			goblinPlayer.play("Run Right")

func _on_GoblinPlayer_animation_started(anim_name):
	if anim_name == "Attack Right" and currentEnemyHitBox != null:
		attackEnemy(currentEnemyHitBox)
	elif anim_name == "Attack Left" and currentEnemyHitBox != null:
		attackEnemy(currentEnemyHitBox)

func _on_GoblinPlayer_animation_finished(anim_name):
	if anim_name == "Attack Right":
		goblinPlayer.play("Attack Right")
		attacking = false
	elif anim_name == "Attack Left":
		goblinPlayer.play("Attack Left")
		attacking = false
