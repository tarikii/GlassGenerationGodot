extends KinematicBody2D

export var speed = 150
onready var damage = 300
onready var wizardPlayer = get_node("../WizardPlayer")
onready var attacking = false
var currentEnemyHitBox = null
var attackCharactersList = []


func _process(delta):
	var velocity = Vector2()
	if wizardPlayer.get_current_animation() == "Run Right":
		# calcular la velocidad basada en la variable de velocidad
		velocity.x += speed * delta
	elif wizardPlayer.get_current_animation() == "Run Left":
		# calcular la velocidad basada en la variable de velocidad
		velocity.x -= speed * delta
	# aplicar la velocidad al FireWorm
	move_and_collide(velocity)


func _on_Area2D_area_entered(enemyHitBox):
	if !attacking:
		if enemyHitBox.is_in_group("PlayerCharacters"):
			wizardPlayer.play("Attack Left")
			attacking = true
			if currentEnemyHitBox != null:
				attackCharactersList.append(currentEnemyHitBox)
			currentEnemyHitBox = enemyHitBox
			if currentEnemyHitBox != null:
				attackEnemy(currentEnemyHitBox)
		elif enemyHitBox.is_in_group("IACharacters"):
			wizardPlayer.play("Attack Right")
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
			wizardPlayer.play("Run Left")
		if attackCharactersList.has(enemyHitBox):
			attackCharactersList.erase(enemyHitBox)
	elif enemyHitBox.is_in_group("IACharacters"):
		if currentEnemyHitBox == enemyHitBox:
			currentEnemyHitBox = null
			attacking = false
			wizardPlayer.play("Run Right")
		if attackCharactersList.has(enemyHitBox):
			attackCharactersList.erase(enemyHitBox)


func attackEnemy(enemy):
	if enemy.is_in_group("PlayerCharacters"):
		if(is_instance_valid(enemy)):
			if enemy.has_method("reduce_health"):
				enemy.reduce_health(damage)
		else:
			attacking = false
			wizardPlayer.play("Run Left")
	elif enemy.is_in_group("IACharacters"):
		if(is_instance_valid(enemy)):
			if enemy.has_method("reduce_health"):
				enemy.reduce_health(damage)
		else:
			attacking = false
			wizardPlayer.play("Run Right")

func _on_WizardPlayer_animation_started(anim_name):
	if anim_name == "Attack Right" and currentEnemyHitBox != null:
		attackEnemy(currentEnemyHitBox)
	elif anim_name == "Attack Left" and currentEnemyHitBox != null:
		attackEnemy(currentEnemyHitBox)

func _on_WizardPlayer_animation_finished(anim_name):
	if anim_name == "Attack Right":
		wizardPlayer.play("Attack Right")
		attacking = false
	elif anim_name == "Attack Left":
		wizardPlayer.play("Attack Left")
		attacking = false
