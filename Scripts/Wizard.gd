extends KinematicBody2D

export var speed = 150
var damage = 300
onready var health = $HPBarWizard
onready var wizardPlayer = get_node("../WizardPlayer")
onready var attacking = false
var currentEnemyHitBox = null

func _process(delta):
	var velocity = Vector2()
	# calcular la velocidad basada en la variable de velocidad
	velocity.x += speed * delta
	# aplicar la velocidad al FireWorm
	move_and_collide(velocity)

func _on_Area2D_area_entered(enemyHitBox):
	if !attacking:
		wizardPlayer.play("Attack Right")
		attacking = true
		currentEnemyHitBox = enemyHitBox
		if currentEnemyHitBox != null:
			attackEnemy(currentEnemyHitBox)

func attackEnemy(enemy):
	if(is_instance_valid(enemy)):
		if enemy.has_method("reduce_health"):
			enemy.reduce_health(damage)
	else:
		attacking = false
		wizardPlayer.play("Run Right")

func _on_WizardPlayer_animation_started(anim_name):
	if anim_name == "Attack Right" and currentEnemyHitBox != null:
		attackEnemy(currentEnemyHitBox)

func _on_WizardPlayer_animation_finished(anim_name):
	if anim_name == "Attack Right":
		wizardPlayer.play("Attack Right")
		attacking = false

