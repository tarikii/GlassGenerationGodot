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


onready var label_gold = $EstadisticasJugador/OroBanco
onready var gold_text = label_gold.get_text()
onready var split_text = gold_text.split(": ")
onready var gold_inicial = int(split_text[1])
onready var gold = gold_inicial
onready var goldEnemy = gold_inicial
var spawn_timer


func _ready():
	spawn_timer = get_tree().create_timer(0.0)

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
	
	waitSpawn()

func pulsarBotonFireWorm():
	if(gold >= 1000):
		var fireWormInstance = fireWormScene.instance()
		fireWormInstance.set_global_position(Vector2(-987, -20))
		var animPlayer = fireWormInstance.get_node("FireWormPlayer")
		animPlayer.play("Walk Right")
		fireWormInstance.add_to_group("PlayerCharacters")
		$Map.add_child(fireWormInstance)
		gold -= 1000
		label_gold.set_text("Oro en el banco: " + str(gold))

func showFireWormText():
	$CostesPersonajes/CostePersonaje.set_text("Fire Worm: Cuesta 1000 de oro")
	$EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$EstadisticasPersonaje/Vida.set_text("Vida: 2500")
	$"EstadisticasPersonaje/Daño".set_text("Daño: 80")

func hideFireWormText():
	$CostesPersonajes/CostePersonaje.set_text(" ")
	$EstadisticasPersonaje/Velocidad.set_text(" ")
	$EstadisticasPersonaje/Vida.set_text(" ")
	$"EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonGoblin():
	if(gold >= 150):
		var goblinInstance = goblinScene.instance()
		goblinInstance.set_global_position(Vector2(-1145, -35))
		var animPlayer = goblinInstance.get_node("GoblinPlayer")
		animPlayer.play("Run Right")
		goblinInstance.add_to_group("PlayerCharacters")
		$Map.add_child(goblinInstance)
		gold -= 150
		label_gold.set_text("Oro en el banco: " + str(gold))

func showGoblinText():
	$CostesPersonajes/CostePersonaje.set_text("Goblin: Cuesta 150 de oro")
	$EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$EstadisticasPersonaje/Vida.set_text("Vida: 750")
	$"EstadisticasPersonaje/Daño".set_text("Daño: 150")

func hideGoblinText():
	$CostesPersonajes/CostePersonaje.set_text(" ")
	$EstadisticasPersonaje/Velocidad.set_text(" ")
	$EstadisticasPersonaje/Vida.set_text(" ")
	$"EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonHuntress():
	if(gold >= 200):
		var huntressInstance = huntressScene.instance()
		huntressInstance.set_global_position(Vector2(-1025, -35))
		var animPlayer = huntressInstance.get_node("HuntressPlayer")
		animPlayer.play("Run Right")
		huntressInstance.add_to_group("PlayerCharacters")
		$Map.add_child(huntressInstance)
		gold -= 200
		label_gold.set_text("Oro en el banco: " + str(gold))

func showHuntressText():
	$CostesPersonajes/CostePersonaje.set_text("Huntress: Cuesta 200 de oro")
	$EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$EstadisticasPersonaje/Vida.set_text("Vida: 750")
	$"EstadisticasPersonaje/Daño".set_text("Daño: 150")

func hideHuntressText():
	$CostesPersonajes/CostePersonaje.set_text(" ")
	$EstadisticasPersonaje/Velocidad.set_text(" ")
	$EstadisticasPersonaje/Vida.set_text(" ")
	$"EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonKnight():
	if(gold >= 500):
		var knightInstance = knightScene.instance()
		knightInstance.set_global_position(Vector2(-1045, 0))
		var animPlayer = knightInstance.get_node("KnightPlayer")
		animPlayer.play("Run Right")
		knightInstance.add_to_group("PlayerCharacters")
		$Map.add_child(knightInstance)
		gold -= 500
		label_gold.set_text("Oro en el banco: " + str(gold))

func showKnightText():
	$CostesPersonajes/CostePersonaje.set_text("Knight: Cuesta 500 de oro")
	$EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$EstadisticasPersonaje/Vida.set_text("Vida: 1300")
	$"EstadisticasPersonaje/Daño".set_text("Daño: 180")

func hideKnightText():
	$CostesPersonajes/CostePersonaje.set_text(" ")
	$EstadisticasPersonaje/Velocidad.set_text(" ")
	$EstadisticasPersonaje/Vida.set_text(" ")
	$"EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonMartialHero():
	if(gold >= 250):
		var martialHeroInstance = martialHeroScene.instance()
		martialHeroInstance.set_global_position(Vector2(-985, -30))
		var animPlayer = martialHeroInstance.get_node("MartialHeroPlayer")
		animPlayer.play("Run Right")
		martialHeroInstance.add_to_group("PlayerCharacters")
		$Map.add_child(martialHeroInstance)
		gold -= 250
		label_gold.set_text("Oro en el banco: " + str(gold))

func showMartialHeroText():
	$CostesPersonajes/CostePersonaje.set_text("Martial Hero: Cuesta 250 de oro")
	$EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$EstadisticasPersonaje/Vida.set_text("Vida: 1000")
	$"EstadisticasPersonaje/Daño".set_text("Daño: 220")

func hideMartialHeroText():
	$CostesPersonajes/CostePersonaje.set_text(" ")
	$EstadisticasPersonaje/Velocidad.set_text(" ")
	$EstadisticasPersonaje/Vida.set_text(" ")
	$"EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonMushroom():
	if(gold >= 900):
		var mushroomInstance = mushroomScene.instance()
		mushroomInstance.set_global_position(Vector2(-1015, -40))
		var animPlayer = mushroomInstance.get_node("MushroomPlayer")
		animPlayer.play("Run Right")
		mushroomInstance.add_to_group("PlayerCharacters")
		$Map.add_child(mushroomInstance)
		gold -= 900
		label_gold.set_text("Oro en el banco: " + str(gold))

func showMushroomText():
	$CostesPersonajes/CostePersonaje.set_text("Mushroom: Cuesta 900 de oro")
	$EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$EstadisticasPersonaje/Vida.set_text("Vida: 1300")
	$"EstadisticasPersonaje/Daño".set_text("Daño: 600")

func hideMushroomText():
	$CostesPersonajes/CostePersonaje.set_text(" ")
	$EstadisticasPersonaje/Velocidad.set_text(" ")
	$EstadisticasPersonaje/Vida.set_text(" ")
	$"EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonUndead():
	if(gold >= 1000):
		var undeadInstance = undeadScene.instance()
		undeadInstance.set_global_position(Vector2(-1010, -70))
		var animPlayer = undeadInstance.get_node("UndeadPlayer")
		animPlayer.play("Walk Right")
		undeadInstance.add_to_group("PlayerCharacters")
		$Map.add_child(undeadInstance)
		gold -= 1000
		label_gold.set_text("Oro en el banco: " + str(gold))

func showUndeadText():
	$CostesPersonajes/CostePersonaje.set_text("Undead: Cuesta 1000 de oro")
	$EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$EstadisticasPersonaje/Vida.set_text("Vida: 2500")
	$"EstadisticasPersonaje/Daño".set_text("Daño: 80")

func hideUndeadText():
	$CostesPersonajes/CostePersonaje.set_text(" ")
	$EstadisticasPersonaje/Velocidad.set_text(" ")
	$EstadisticasPersonaje/Vida.set_text(" ")
	$"EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonWarrior():
	if(gold >= 400):
		var warriorInstance = warriorScene.instance()
		warriorInstance.set_global_position(Vector2(-880, -30))
		var animPlayer = warriorInstance.get_node("WarriorPlayer")
		animPlayer.play("Run Right")
		warriorInstance.add_to_group("PlayerCharacters")
		$Map.add_child(warriorInstance)
		gold -= 400
		label_gold.set_text("Oro en el banco: " + str(gold))

func showWarriorText():
	$CostesPersonajes/CostePersonaje.set_text("Warrior: Cuesta 400 de oro")
	$EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$EstadisticasPersonaje/Vida.set_text("Vida: 1200")
	$"EstadisticasPersonaje/Daño".set_text("Daño: 200")

func hideWarriorText():
	$CostesPersonajes/CostePersonaje.set_text(" ")
	$EstadisticasPersonaje/Velocidad.set_text(" ")
	$EstadisticasPersonaje/Vida.set_text(" ")
	$"EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonWitch():
	if(gold >= 800):
		var witchInstance = witchScene.instance()
		witchInstance.set_global_position(Vector2(-970, 0))
		var animPlayer = witchInstance.get_node("WitchPlayer")
		animPlayer.play("Run Right")
		witchInstance.add_to_group("PlayerCharacters")
		$Map.add_child(witchInstance)
		gold -= 800
		label_gold.set_text("Oro en el banco: " + str(gold))

func showWitchText():
	$CostesPersonajes/CostePersonaje.set_text("Witch: Cuesta 800 de oro")
	$EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$EstadisticasPersonaje/Vida.set_text("Vida: 1100")
	$"EstadisticasPersonaje/Daño".set_text("Daño: 350")

func hideWitchText():
	$CostesPersonajes/CostePersonaje.set_text(" ")
	$EstadisticasPersonaje/Velocidad.set_text(" ")
	$EstadisticasPersonaje/Vida.set_text(" ")
	$"EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonWizard():
	if(gold >= 700):
		var wizardInstance = wizardScene.instance()
		wizardInstance.set_global_position(Vector2(-1020, 0))
		var animPlayer = wizardInstance.get_node("WizardPlayer")
		animPlayer.play("Run Right")
		wizardInstance.add_to_group("PlayerCharacters")
		$Map.add_child(wizardInstance)
		gold -= 700
		label_gold.set_text("Oro en el banco: " + str(gold))

func showWizardText():
	$CostesPersonajes/CostePersonaje.set_text("Wizard: Cuesta 700 de oro")
	$EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$EstadisticasPersonaje/Vida.set_text("Vida: 900")
	$"EstadisticasPersonaje/Daño".set_text("Daño: 300")

func hideWizardText():
	$CostesPersonajes/CostePersonaje.set_text(" ")
	$EstadisticasPersonaje/Velocidad.set_text(" ")
	$EstadisticasPersonaje/Vida.set_text(" ")
	$"EstadisticasPersonaje/Daño".set_text(" ")


func spawnRandomEnemy():
	var instances = [fireWormScene, goblinScene, huntressScene, knightScene, martialHeroScene, mushroomScene, undeadScene, warriorScene, witchScene, wizardScene]
	var randomScene = instances[randi() % instances.size()]
	
	print(instances[randi() % instances.size()].get_path())
	
	if randomScene.get_path() == fireWormScene.get_path():
		if(goldEnemy >= 1000):
			var randomInstance = randomScene.instance()
			randomInstance.set_global_position(Vector2(987,-20))
			var animPlayer = randomInstance.get_node("FireWormPlayer")
			animPlayer.play("Walk Left")
			randomInstance.add_to_group("IACharacters")
			$Map.add_child(randomInstance)
			goldEnemy -= 1000
	elif randomScene.get_path() == goblinScene.get_path():
		if(goldEnemy >= 150):
			var randomInstance = randomScene.instance()
			randomInstance.set_global_position(Vector2(-220,-35))
			var animPlayer = randomInstance.get_node("GoblinPlayer")
			animPlayer.play("Run Left")
			randomInstance.add_to_group("IACharacters")
			$Map.add_child(randomInstance)
			goldEnemy -= 150
	elif randomScene.get_path() == huntressScene.get_path():
		if(goldEnemy >= 200):
			var randomInstance = randomScene.instance()
			randomInstance.set_global_position(Vector2(-1025,-35))
			var animPlayer = randomInstance.get_node("HuntressPlayer")
			animPlayer.play("Run Left")
			randomInstance.add_to_group("IACharacters")
			$Map.add_child(randomInstance)
			goldEnemy -= 200
	elif randomScene.get_path() == knightScene.get_path():
		if(goldEnemy >= 500):
			var randomInstance = randomScene.instance()
			randomInstance.set_global_position(Vector2(-1045, 0))
			var animPlayer = randomInstance.get_node("KnightPlayer")
			animPlayer.play("Run Left")
			randomInstance.add_to_group("IACharacters")
			$Map.add_child(randomInstance)
			goldEnemy -= 500
	elif randomScene.get_path() == martialHeroScene.get_path():
		if(goldEnemy >= 250):
			var randomInstance = randomScene.instance()
			randomInstance.set_global_position(Vector2(-985, -30))
			var animPlayer = randomInstance.get_node("MartialHeroPlayer")
			animPlayer.play("Run Left")
			randomInstance.add_to_group("IACharacters")
			$Map.add_child(randomInstance)
			goldEnemy -= 250
	elif randomScene.get_path() == mushroomScene.get_path():
		if(goldEnemy >= 900):
			var randomInstance = randomScene.instance()
			randomInstance.set_global_position(Vector2(-1015, -40))
			var animPlayer = randomInstance.get_node("MushroomPlayer")
			animPlayer.play("Run Left")
			randomInstance.add_to_group("IACharacters")
			$Map.add_child(randomInstance)
			goldEnemy -= 900
	elif randomScene.get_path() == undeadScene.get_path():
		if(goldEnemy >= 1000):
			var randomInstance = randomScene.instance()
			randomInstance.set_global_position(Vector2(-1010, -70))
			var animPlayer = randomInstance.get_node("UndeadPlayer")
			animPlayer.play("Walk Left")
			randomInstance.add_to_group("IACharacters")
			$Map.add_child(randomInstance)
			goldEnemy -= 1000
	elif randomScene.get_path() == warriorScene.get_path():
		if(goldEnemy >= 400):
			var randomInstance = randomScene.instance()
			randomInstance.set_global_position(Vector2(-880, -30))
			var animPlayer = randomInstance.get_node("WarriorPlayer")
			animPlayer.play("Run Left")
			randomInstance.add_to_group("IACharacters")
			$Map.add_child(randomInstance)
			goldEnemy -= 400
	elif randomScene.get_path() == witchScene.get_path():
		if(goldEnemy >= 800):
			var randomInstance = randomScene.instance()
			randomInstance.set_global_position(Vector2(-970, 0))
			var animPlayer = randomInstance.get_node("WitchPlayer")
			animPlayer.play("Run Left")
			randomInstance.add_to_group("IACharacters")
			$Map.add_child(randomInstance)
			goldEnemy -= 800
	elif randomScene.get_path() == wizardScene.get_path():
		if(goldEnemy >= 700):
			var randomInstance = randomScene.instance()
			randomInstance.set_global_position(Vector2(-110, 0))
			var animPlayer = randomInstance.get_node("WizardPlayer")
			animPlayer.play("Run Left")
			randomInstance.add_to_group("IACharacters")
			$Map.add_child(randomInstance)
			goldEnemy -= 700

func waitSpawn():
	if spawn_timer.time_left <= 0.0:
		spawn_timer = get_tree().create_timer(1.0)
		yield(spawn_timer, "timeout")
		spawnRandomEnemy()
