extends ParallaxBackground

var DIR = Vector2(1, 0)
var speed = 40
var screen_size = Vector2.ZERO

func _ready():
	screen_size = get_viewport().size

func _physics_process(delta):
	scroll_base_offset += DIR * speed * delta
	
	if scroll_base_offset.x > screen_size.x/18:
		DIR = Vector2(-1, 0)
	elif scroll_base_offset.x < 0:
		DIR = Vector2(1, 0)
