extends Node2D

var rng = RandomNumberGenerator.new()
var time = 0
var rotation_speed = 1

var bullet_scene: Node2D

func _ready():
	pass

func _process(delta):
	time += delta / 2
	
	rotate((4 * PI) * (delta * rotation_speed))
	
	var rng_number = rng.randf_range(0.01, 0.073)
	
	if time > rng_number:
		bullet_scene = load("res://scenes/bullet.tscn").instantiate()
		bullet_scene.position = self.position
		bullet_scene.rotation = self.rotation
		get_parent().add_child(bullet_scene)
		time = 0
