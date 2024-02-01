extends Node2D

var rng = RandomNumberGenerator.new()
var time = 0
var rotation_speed = 1

var phase_3_id: int = 0

var bullet: Node2D
var bullet_small: Node2D

func _ready():
	pass

func _process(delta):
	time += delta
	
	rotate((4 * PI) * (delta * rotation_speed))
	
	var rng_number = rng.randf_range(0.01, 0.073)
	
	if time > rng_number:
		bullet = load("res://scenes/bullet.tscn").instantiate()
		bullet.position = self.position
		bullet.rotation = self.rotation
		get_parent().add_child(bullet)
		if phase_3_id > 0:
			time += delta * 5
			bullet_small = load("res://scenes/bullet_small.tscn").instantiate()
			bullet_small.position = self.position
			bullet_small.rotation = -self.rotation
			get_parent().add_child(bullet_small)
		time = 0

func _on_boss_phase_1_timeout():
	rotation_speed += 100 

func _on_boss_phase_2_timeout():
	rotation_speed -= 100
	rotation_speed *= -1

func _on_boss_phase_3_timeout():
	phase_3_id = 1
