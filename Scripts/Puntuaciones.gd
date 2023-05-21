extends Control
var escenaMenu

func _ready():
	
	var nombres = File.new()
	var puntuaciones = File.new()
	var resultados = File.new()
	
	nombres.open("res://Resources/Registros/nombres.txt", File.READ)
	puntuaciones.open("res://Resources/Registros/puntuaciones.txt", File.READ)
	resultados.open("res://Resources/Registros/resultados.txt", File.READ)
	
	
	var i = 0
	print(nombres.get_len())
	while i < nombres.get_len():
		var nombre=nombres.get_line()
		var puntuacion=puntuaciones.get_line()
		var resultado=resultados.get_line()
		match nombre:
			"":
				print("nada")
		
			_:
				var jugadorl = Label.new()
				jugadorl.set_text(nombre)
				jugadorl.set_size(Vector2(319,37))
				jugadorl.add_color_override("font_color", Color(0, 1, 1, 1))
				jugadorl.set_align(1)

				var puntuacionl = Label.new()
				puntuacionl.set_text(puntuacion)
				puntuacionl.set_size(Vector2(319,37))
				puntuacionl.add_color_override("font_color", Color(0, 1, 1, 1))
				puntuacionl.set_align(1)
				
				var resultadol = Label.new()
				resultadol.set_text(resultado)
				resultadol.set_size(Vector2(319,37))
				resultadol.add_color_override("font_color", Color(0, 1, 1, 1))
				resultadol.set_align(1)

				$Fondomenu/ColorRect/VBoxNicknames.add_child(jugadorl)
				$Fondomenu/ColorRect/VBoxPoints.add_child(puntuacionl)
				$Fondomenu/ColorRect/VBoxResult.add_child(resultadol)
			
		i += 1
	
	
	nombres.close()
	puntuaciones.close()

func volverAlMenu():
	escenaMenu = "res://Scenes/Menu.tscn"
	get_tree().change_scene(escenaMenu)
