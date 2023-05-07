extends Node2D

const SPEED = 500

func _process(delta):
	# Obtener el tamaño del sprite y del viewport
	var spriteSize = $Map.texture.get_size()
	var viewportSize = get_viewport_rect().size
	
	var estructuraJugadorSize = $EstructuraJugador.get_viewport_rect().size
	var estructuraEnemigaSize = $EstructuraEnemiga.get_viewport_rect().size
	
	var half_viewport_width = viewportSize.x / 2
	var half_sprite_width = spriteSize.x / 2
	
	# Calcular la posición máxima permitida del sprite (dividida entre 2)
	var max_x = half_sprite_width - half_viewport_width
	
	# Mover el sprite hacia la derecha o la izquierda
	if Input.is_action_pressed("ui_right") and $Map.position.x > -max_x -250:
		$Map.position.x -= SPEED * delta
		$EstructuraJugador.position.x -= SPEED * delta
		$EstructuraEnemiga.position.x -= SPEED * delta
	elif Input.is_action_pressed("ui_left") and $Map.position.x < max_x + spriteSize.x:
		$Map.position.x += SPEED * delta
		$EstructuraEnemiga.position.x += SPEED * delta
		$EstructuraJugador.position.x += SPEED * delta
