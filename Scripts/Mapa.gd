extends Node2D

const SPEED = 500

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
	var fireWormScene = load("res://Animations/FireWorm.tscn")
	var fireWormInstance = fireWormScene.instance()
	fireWormInstance.set_global_position(Vector2(-987, -20))
	$Map.add_child(fireWormInstance)


func pulsarBotonGoblin():
	var goblinScene = load("res://Animations/Goblin.tscn")
	var goblinInstance = goblinScene.instance()
	goblinInstance.set_global_position(Vector2(-1145, -55))
	$Map.add_child(goblinInstance)


func pulsarBotonHuntress():
	var huntressScene = load("res://Animations/Huntress.tscn")
	var huntressInstance = huntressScene.instance()
	huntressInstance.set_global_position(Vector2(-1045, -35))
	$Map.add_child(huntressInstance)


func pulsarBotonKnight():
	var knightScene = load("res://Animations/Knight.tscn")
	var knightInstance = knightScene.instance()
	knightInstance.set_global_position(Vector2(-1045, 0))
	$Map.add_child(knightInstance)


func pulsarBotonMartialHero():
	var martialHeroScene = load("res://Animations/MartialHero.tscn")
	var martialHeroInstance = martialHeroScene.instance()
	martialHeroInstance.set_global_position(Vector2(-985, -30))
	$Map.add_child(martialHeroInstance)


func pulsarBotonMushroom():
	var mushroomScene = load("res://Animations/Mushroom.tscn")
	var mushroomInstance = mushroomScene.instance()
	mushroomInstance.set_global_position(Vector2(-1015, -40))
	$Map.add_child(mushroomInstance)


func pulsarBotonUndead():
	var undeadScene = load("res://Animations/Undead.tscn")
	var undeadInstance = undeadScene.instance()
	undeadInstance.set_global_position(Vector2(-1010, -70))
	$Map.add_child(undeadInstance)


func pulsarBotonWarrior():
	var warriorScene = load("res://Animations/Warrior.tscn")
	var warriorInstance = warriorScene.instance()
	warriorInstance.set_global_position(Vector2(-880, -30))
	$Map.add_child(warriorInstance)


func pulsarBotonWitch():
	var witchScene = load("res://Animations/Witch.tscn")
	var witchInstance = witchScene.instance()
	witchInstance.set_global_position(Vector2(-970, 0))
	$Map.add_child(witchInstance)


func pulsarBotonWizard():
	var wizardScene = load("res://Animations/Wizard.tscn")
	var wizardInstance = wizardScene.instance()
	wizardInstance.set_global_position(Vector2(-1000, -20))
	$Map.add_child(wizardInstance)
