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

onready var label_gold = $Camera2D/CanvasLayer/EstadisticasJugador/OroBanco
onready var gold_text = label_gold.get_text()
onready var split_textGold = gold_text.split(": ")
onready var gold_inicial = int(split_textGold[1])
onready var gold = gold_inicial
onready var goldEnemy = gold_inicial
onready var label_points = $Camera2D/CanvasLayer/EstadisticasJugador/Puntos
onready var points_text = label_points.get_text()
onready var split_textPoints = points_text.split(": ")
onready var points_inicial = int(split_textPoints[1])
onready var points = points_inicial
onready var sacarPersonaje=0
onready var posicionh=0
onready var personajeSacado=false

var spawn_timer
var time_since_last_reward = 0.0
var reward_interval = 5.0  # Intervalo de tiempo entre recompensas (en segundos)

func _ready():
	MusicMenu.stop_musicMenu()
	spawn_timer = get_tree().create_timer(0.0)

func _process(delta):
	# Obtener el tamaño del sprite y del viewport
	if personajeSacado == true:
		sacarPersonaje += 0.01
		if sacarPersonaje > 1.50:
			personajeSacado = false
			sacarPersonaje = 0
			$Camera2D/CanvasLayer/EstadisticasJugador/DelayBar.value = 0
		
	if personajeSacado == true:
			$Camera2D/CanvasLayer/EstadisticasJugador/DelayBar.value += sacarPersonaje
		
	var spriteSize = $Map.texture.get_size()
	var viewportSize = get_viewport_rect().size
	
	var half_viewport_width = viewportSize.x / 2
	var half_sprite_width = spriteSize.x / 2
	
	# Calcular la posición máxima permitida del sprite (dividida entre 2)
	var max_x = half_sprite_width - half_viewport_width
	
	# Mover el sprite hacia la derecha o la izquierda
	if Input.is_action_pressed("ui_right") && posicionh < 1800:
		posicionh += 10
		$Camera2D.set_offset(Vector2(posicionh,0))
		
	elif Input.is_action_pressed("ui_left") && posicionh > 0:
		posicionh -= 10
		$Camera2D.set_offset(Vector2(posicionh,0))
	
	waitSpawn()
	time_since_last_reward += delta
	if time_since_last_reward >= reward_interval:
		winGoldPointsTime()
		time_since_last_reward = 0.0

func pulsarBotonFireWorm():
	if(gold >= 1000 && personajeSacado == false):
		var fireWormInstance = fireWormScene.instance()
		fireWormInstance.set_global_position(Vector2(-967, -20))
		var animPlayer = fireWormInstance.get_node("FireWormPlayer")
		animPlayer.play("Walk Right")
		fireWormInstance.add_to_group("PlayerCharacters")
		$Map.add_child(fireWormInstance)
		gold -= 1000
		personajeSacado = true
		label_gold.set_text("Oro en el banco: " + str(gold))

func showFireWormText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text("Fire Worm: Cuesta 1000 de oro")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text("Vida: 2510")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text("Daño: 80")

func hideFireWormText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text(" ")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonGoblin():
	print(personajeSacado)
	if(gold >= 150 && personajeSacado == false):
		var goblinInstance = goblinScene.instance()
		goblinInstance.set_global_position(Vector2(-1145, -35))
		var animPlayer = goblinInstance.get_node("GoblinPlayer")
		animPlayer.play("Run Right")
		goblinInstance.add_to_group("PlayerCharacters")
		$Map.add_child(goblinInstance)
		gold -= 150
		personajeSacado = true
		label_gold.set_text("Oro en el banco: " + str(gold))

func showGoblinText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text("Goblin: Cuesta 150 de oro")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text("Vida: 770")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text("Daño: 150")

func hideGoblinText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text(" ")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonHuntress():
	if(gold >= 200 && personajeSacado == false):
		var huntressInstance = huntressScene.instance()
		huntressInstance.set_global_position(Vector2(-1025, -35))
		var animPlayer = huntressInstance.get_node("HuntressPlayer")
		animPlayer.play("Run Right")
		huntressInstance.add_to_group("PlayerCharacters")
		$Map.add_child(huntressInstance)
		gold -= 200
		personajeSacado = true
		label_gold.set_text("Oro en el banco: " + str(gold))

func showHuntressText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text("Huntress: Cuesta 200 de oro")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text("Vida: 770")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text("Daño: 150")

func hideHuntressText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text(" ")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonKnight():
	if(gold >= 500 && personajeSacado == false):
		var knightInstance = knightScene.instance()
		knightInstance.set_global_position(Vector2(-1025, 0))
		var animPlayer = knightInstance.get_node("KnightPlayer")
		animPlayer.play("Run Right")
		knightInstance.add_to_group("PlayerCharacters")
		$Map.add_child(knightInstance)
		gold -= 500
		personajeSacado = true
		label_gold.set_text("Oro en el banco: " + str(gold))

func showKnightText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text("Knight: Cuesta 500 de oro")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text("Vida: 1310")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text("Daño: 180")

func hideKnightText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text(" ")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonMartialHero():
	if(gold >= 250 && personajeSacado == false):
		var martialHeroInstance = martialHeroScene.instance()
		martialHeroInstance.set_global_position(Vector2(-965, -30))
		var animPlayer = martialHeroInstance.get_node("MartialHeroPlayer")
		animPlayer.play("Run Right")
		martialHeroInstance.add_to_group("PlayerCharacters")
		$Map.add_child(martialHeroInstance)
		gold -= 250
		personajeSacado = true
		label_gold.set_text("Oro en el banco: " + str(gold))

func showMartialHeroText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text("Martial Hero: Cuesta 250 de oro")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text("Vida: 1117")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text("Daño: 220")

func hideMartialHeroText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text(" ")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonMushroom():
	if(gold >= 900 && personajeSacado == false):
		var mushroomInstance = mushroomScene.instance()
		mushroomInstance.set_global_position(Vector2(-985, -40))
		var animPlayer = mushroomInstance.get_node("MushroomPlayer")
		animPlayer.play("Run Right")
		mushroomInstance.add_to_group("PlayerCharacters")
		$Map.add_child(mushroomInstance)
		gold -= 900
		personajeSacado = true
		label_gold.set_text("Oro en el banco: " + str(gold))

func showMushroomText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text("Mushroom: Cuesta 900 de oro")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text("Vida: 1310")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text("Daño: 600")

func hideMushroomText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text(" ")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonUndead():
	if(gold >= 500 && personajeSacado == false):
		var undeadInstance = undeadScene.instance()
		undeadInstance.set_global_position(Vector2(-1010, -70))
		var animPlayer = undeadInstance.get_node("UndeadPlayer")
		animPlayer.play("Walk Right")
		undeadInstance.add_to_group("PlayerCharacters")
		$Map.add_child(undeadInstance)
		gold -= 500
		personajeSacado = true
		label_gold.set_text("Oro en el banco: " + str(gold))

func showUndeadText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text("Undead: Cuesta 1000 de oro")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text("Vida: 2510")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text("Daño: 80")

func hideUndeadText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text(" ")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonWarrior():
	if(gold >= 400 && personajeSacado == false):
		var warriorInstance = warriorScene.instance()
		warriorInstance.set_global_position(Vector2(-860, -30))
		var animPlayer = warriorInstance.get_node("WarriorPlayer")
		animPlayer.play("Run Right")
		warriorInstance.add_to_group("PlayerCharacters")
		$Map.add_child(warriorInstance)
		gold -= 400
		personajeSacado = true
		label_gold.set_text("Oro en el banco: " + str(gold))

func showWarriorText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text("Warrior: Cuesta 400 de oro")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text("Vida: 1210")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text("Daño: 200")

func hideWarriorText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text(" ")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonWitch():
	if(gold >= 800 && personajeSacado == false):
		var witchInstance = witchScene.instance()
		witchInstance.set_global_position(Vector2(-950, 0))
		var animPlayer = witchInstance.get_node("WitchPlayer")
		animPlayer.play("Run Right")
		witchInstance.add_to_group("PlayerCharacters")
		$Map.add_child(witchInstance)
		gold -= 800
		personajeSacado = true
		label_gold.set_text("Oro en el banco: " + str(gold))

func showWitchText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text("Witch: Cuesta 800 de oro")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text("Vida: 1110")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text("Daño: 350")

func hideWitchText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text(" ")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text(" ")

func pulsarBotonWizard():
	if(gold >= 700 && personajeSacado == false):
		var wizardInstance = wizardScene.instance()
		wizardInstance.set_global_position(Vector2(-1010, 0))
		var animPlayer = wizardInstance.get_node("WizardPlayer")
		animPlayer.play("Run Right")
		wizardInstance.add_to_group("PlayerCharacters")
		$Map.add_child(wizardInstance)
		gold -= 700
		personajeSacado = true
		label_gold.set_text("Oro en el banco: " + str(gold))

func showWizardText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text("Wizard: Cuesta 700 de oro")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text("Velocidad: 150")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text("Vida: 910")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text("Daño: 300")

func hideWizardText():
	$Camera2D/CanvasLayer/CostesPersonajes/CostePersonaje.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Velocidad.set_text(" ")
	$Camera2D/CanvasLayer/EstadisticasPersonaje/Vida.set_text(" ")
	$"Camera2D/CanvasLayer/EstadisticasPersonaje/Daño".set_text(" ")


func spawnRandomEnemy():
	var instances = [fireWormScene,goblinScene,huntressScene,knightScene,martialHeroScene, mushroomScene, undeadScene, warriorScene, witchScene, wizardScene]
	var randomScene = instances[randi() % instances.size()]

	if randomScene.get_path() == fireWormScene.get_path():
		if(goldEnemy >= 1000):
			var randomInstance = randomScene.instance()
			randomInstance.set_global_position(Vector2(-117,-30))
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
			randomInstance.set_global_position(Vector2(-125,-35))
			var animPlayer = randomInstance.get_node("HuntressPlayer")
			animPlayer.play("Run Left")
			randomInstance.add_to_group("IACharacters")
			$Map.add_child(randomInstance)
			goldEnemy -= 200
	elif randomScene.get_path() == knightScene.get_path():
		if(goldEnemy >= 500):
			var randomInstance = randomScene.instance()
			randomInstance.set_global_position(Vector2(-145, 0))
			var animPlayer = randomInstance.get_node("KnightPlayer")
			animPlayer.play("Run Left")
			randomInstance.add_to_group("IACharacters")
			$Map.add_child(randomInstance)
			goldEnemy -= 500
	elif randomScene.get_path() == martialHeroScene.get_path():
		if(goldEnemy >= 250):
			var randomInstance = randomScene.instance()
			randomInstance.set_global_position(Vector2(-85, -30))
			var animPlayer = randomInstance.get_node("MartialHeroPlayer")
			animPlayer.play("Run Left")
			randomInstance.add_to_group("IACharacters")
			$Map.add_child(randomInstance)
			goldEnemy -= 250
	elif randomScene.get_path() == mushroomScene.get_path():
		if(goldEnemy >= 900):
			var randomInstance = randomScene.instance()
			randomInstance.set_global_position(Vector2(-135, -40))
			var animPlayer = randomInstance.get_node("MushroomPlayer")
			animPlayer.play("Run Left")
			randomInstance.add_to_group("IACharacters")
			$Map.add_child(randomInstance)
			goldEnemy -= 900
	elif randomScene.get_path() == undeadScene.get_path():
		if(goldEnemy >= 1000):
			var randomInstance = randomScene.instance()
			randomInstance.set_global_position(Vector2(-100, -70))
			var animPlayer = randomInstance.get_node("UndeadPlayer")
			animPlayer.play("Walk Left")
			randomInstance.add_to_group("IACharacters")
			$Map.add_child(randomInstance)
			goldEnemy -= 1000
	elif randomScene.get_path() == warriorScene.get_path():
		if(goldEnemy >= 400):
			var randomInstance = randomScene.instance()
			randomInstance.set_global_position(Vector2(-20, -30))
			var animPlayer = randomInstance.get_node("WarriorPlayer")
			animPlayer.play("Run Left")
			randomInstance.add_to_group("IACharacters")
			$Map.add_child(randomInstance)
			goldEnemy -= 400
	elif randomScene.get_path() == witchScene.get_path():
		if(goldEnemy >= 800):
			var randomInstance = randomScene.instance()
			randomInstance.set_global_position(Vector2(-70, 0))
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
		spawn_timer = get_tree().create_timer(1.5)
		yield(spawn_timer, "timeout")
		spawnRandomEnemy()


func winGoldPointsTime():
		gold += 100
		goldEnemy += 100
		points += 20
		Points.points += 20
		label_gold.set_text("Oro en el banco: " + str(gold))
		label_points.set_text("Puntos: " + str(points))
