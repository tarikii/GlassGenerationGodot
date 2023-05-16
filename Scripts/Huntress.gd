extends KinematicBody2D

export var speed = 150
onready var damage = 150
onready var huntressPlayer = get_node("../HuntressPlayer")
onready var attacking = false
var currentEnemyHitBox = null
var attackCharactersList = []
var direction = "Left"
var isAttackingEnemy = false
var isIdle = false
var wasBehind = false

func _process(delta):
	var velocity = Vector2()
	if huntressPlayer.get_current_animation() == "Run Right":
		# calcular la velocidad basada en la variable de velocidad
		velocity.x += speed * delta
		direction = "Right"
	elif huntressPlayer.get_current_animation() == "Run Left":
		# calcular la velocidad basada en la variable de velocidad
		velocity.x -= speed * delta
		direction = "Left"
	# aplicar la velocidad al FireWorm
	move_and_collide(velocity)


func _on_Area2D_area_entered(enemyHitBox):
	if !attacking:
		if (enemyHitBox.kinematic.direction == "Left" and direction == "Right") or (enemyHitBox.kinematic.direction == "Right" and direction == "Left"):
			huntressPlayer.play("Attack " + direction)
			attacking = true
			isAttackingEnemy = true
			isIdle = false
			if currentEnemyHitBox != null:
				attackCharactersList.append(currentEnemyHitBox)
			currentEnemyHitBox = enemyHitBox
			if currentEnemyHitBox != null:
				attackEnemy(currentEnemyHitBox)
		elif (enemyHitBox.kinematic.direction == "Left" and direction == "Left") or (enemyHitBox.kinematic.direction == "Right" and direction == "Right"):
			if enemyHitBox != currentEnemyHitBox:
				isIdle = true
				if isAttackingEnemy:
					return
				if !isIdle:
					huntressPlayer.play("Attack " + direction)
					attacking = true
					if currentEnemyHitBox != null:
						attackCharactersList.append(currentEnemyHitBox)
					currentEnemyHitBox = enemyHitBox
					if currentEnemyHitBox != null:
						attackEnemy(currentEnemyHitBox)
					wasBehind = false
				else:
					huntressPlayer.play("Idle " + direction)
					attacking = false
					wasBehind = true

func _on_Area2D_area_exited(enemyHitBox):
	if (enemyHitBox.kinematic.direction == "Left" and direction == "Right") or (enemyHitBox.kinematic.direction == "Right" and direction == "Left"):
		if currentEnemyHitBox == enemyHitBox:
			currentEnemyHitBox = null
			attacking = false
			huntressPlayer.play("Run " + direction)
		if wasBehind:
			attacking = false
			huntressPlayer.play("Run " + direction)
		if attackCharactersList.has(enemyHitBox):
			attackCharactersList.erase(enemyHitBox)
	elif (enemyHitBox.kinematic.direction == "Left" and direction == "Left") or (enemyHitBox.kinematic.direction == "Right" and direction == "Right"):
		if currentEnemyHitBox == enemyHitBox:
			currentEnemyHitBox = null
			attacking = false
			huntressPlayer.play("Run " + direction)
		if wasBehind:
			attacking = false
			huntressPlayer.play("Run " + direction)
		if attackCharactersList.has(enemyHitBox):
			attackCharactersList.erase(enemyHitBox)


func attackEnemy(enemy):
	if enemy.is_in_group("PlayerCharacters"):
		if(is_instance_valid(enemy)):
			if enemy.has_method("reduce_health"):
				enemy.reduce_health(damage)
		else:
			attacking = false
			huntressPlayer.play("Run " + direction)
	elif enemy.is_in_group("IACharacters"):
		if(is_instance_valid(enemy)):
			if enemy.has_method("reduce_health"):
				enemy.reduce_health(damage)
		else:
			attacking = false
			huntressPlayer.play("Run " + direction)

func _on_HuntressPlayer_animation_started(anim_name):
	if anim_name == "Attack Right" and currentEnemyHitBox != null:
		attackEnemy(currentEnemyHitBox)
	elif anim_name == "Attack Left" and currentEnemyHitBox != null:
		attackEnemy(currentEnemyHitBox)

func _on_HuntressPlayer_animation_finished(anim_name):
	if anim_name == "Attack Right":
		huntressPlayer.play("Attack Right")
		attacking = false
	elif anim_name == "Attack Left":
		huntressPlayer.play("Attack Left")
		attacking = false
