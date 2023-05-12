extends Node2D

const SPEED = 500

onready var base_enemiga = $Map/EstructuraEnemiga
onready var fireWormScene = load("res://Animations/FireWorm.tscn")
onready var goblinScene = load("res://Animations/Goblin.tscn")
onready var huntressScene = load("res://Animations/Huntress.tscn")
onready var knightScene = load("res://Animations/Knight.tscn")
onready var martialHeroScene = load("res://Animations/MartialHero.tscn")
onready var mushroomScene = load("res://Animations/Mushroom.tscn")
onready var undeadScene = load("res://Animations/Undead.tscn")
onready var warriorScene = load("res://Animations/Warrior.tscn")
onready var witchScene = load("res://Animations/Witch.tscn")
onready var wizardScene = load("res://Animations/Wizard.tscn")


func _process(delta):
	# Obtener el tamaño del sprite y del viewport
	var spriteSize = $Map.texture.get_size()
	var viewportSize = get_viewport_rect().size
	
	var half_viewport_width = viewportSize.x / 2
	var half_sprite_width = spriteSize.x / 2
	
	# Calcular la posición máxima permitida del sprite (dividida entre 2)
	var max_x = half_sprite_width - half_viewport_width
	
	# Mover el sprite hacia la derecha o la izquierda
	if Input.is_action_pressed("ui_right") and $Map.position.x > -max_x -250:
		$Map.position.x -= SPEED * delta
		$Map/BotonesPersonajes/HBoxBotonesSuperior.rect_position.x += SPEED / 2.5 * delta
		$Map/BotonesPersonajes/HBoxBotonesInferior.rect_position.x += SPEED / 2.5 * delta
	elif Input.is_action_pressed("ui_left") and $Map.position.x < max_x + spriteSize.x:
		$Map.position.x += SPEED * delta
		$Map/BotonesPersonajes/HBoxBotonesSuperior.rect_position.x -= SPEED / 2.5 * delta
		$Map/BotonesPersonajes/HBoxBotonesInferior.rect_position.x -= SPEED / 2.5 * delta
		


func pulsarBotonFireWorm():
	var fireWormInstance = fireWormScene.instance()
	fireWormInstance.set_global_position(Vector2(-987, -20))
	var animPlayer = fireWormInstance.get_node("FireWormPlayer")
	animPlayer.play("Walk Right")
	fireWormInstance.add_to_group("PlayerCharacters")
	$Map.add_child(fireWormInstance)


func pulsarBotonGoblin():
	var goblinInstance = goblinScene.instance()
	goblinInstance.set_global_position(Vector2(-1145, -35))
	var animPlayer = goblinInstance.get_node("GoblinPlayer")
	animPlayer.play("Run Right")
	goblinInstance.add_to_group("PlayerCharacters")
	$Map.add_child(goblinInstance)


func pulsarBotonHuntress():
	var huntressInstance = huntressScene.instance()
	huntressInstance.set_global_position(Vector2(-1045, -35))
	var animPlayer = huntressInstance.get_node("HuntressPlayer")
	animPlayer.play("Run Right")
	huntressInstance.add_to_group("PlayerCharacters")
	$Map.add_child(huntressInstance)


func pulsarBotonKnight():
	var knightInstance = knightScene.instance()
	knightInstance.set_global_position(Vector2(-1045, 0))
	var animPlayer = knightInstance.get_node("KnightPlayer")
	animPlayer.play("Run Right")
	knightInstance.add_to_group("PlayerCharacters")
	$Map.add_child(knightInstance)


func pulsarBotonMartialHero():
	var martialHeroInstance = martialHeroScene.instance()
	martialHeroInstance.set_global_position(Vector2(-985, -30))
	var animPlayer = martialHeroInstance.get_node("MartialHeroPlayer")
	animPlayer.play("Run Right")
	martialHeroInstance.add_to_group("PlayerCharacters")
	$Map.add_child(martialHeroInstance)


func pulsarBotonMushroom():
	var mushroomInstance = mushroomScene.instance()
	mushroomInstance.set_global_position(Vector2(-1015, -40))
	var animPlayer = mushroomInstance.get_node("MushroomPlayer")
	animPlayer.play("Run Right")
	mushroomInstance.add_to_group("PlayerCharacters")
	$Map.add_child(mushroomInstance)


func pulsarBotonUndead():
	var undeadInstance = undeadScene.instance()
	undeadInstance.set_global_position(Vector2(-1010, -70))
	var animPlayer = undeadInstance.get_node("UndeadPlayer")
	animPlayer.play("Walk Right")
	undeadInstance.add_to_group("PlayerCharacters")
	$Map.add_child(undeadInstance)


func pulsarBotonWarrior():
	var warriorInstance = warriorScene.instance()
	warriorInstance.set_global_position(Vector2(-880, -30))
	var animPlayer = warriorInstance.get_node("WarriorPlayer")
	animPlayer.play("Run Right")
	warriorInstance.add_to_group("PlayerCharacters")
	$Map.add_child(warriorInstance)


func pulsarBotonWitch():
	var witchInstance = witchScene.instance()
	witchInstance.set_global_position(Vector2(-970, 0))
	var animPlayer = witchInstance.get_node("WitchPlayer")
	animPlayer.play("Run Right")
	witchInstance.add_to_group("PlayerCharacters")
	$Map.add_child(witchInstance)


func pulsarBotonWizard():
	var wizardInstance = wizardScene.instance()
	wizardInstance.set_global_position(Vector2(-1040, 0))
	var animPlayer = wizardInstance.get_node("WizardPlayer")
	animPlayer.play("Run Right")
	wizardInstance.add_to_group("PlayerCharacters")
	$Map.add_child(wizardInstance)
	
