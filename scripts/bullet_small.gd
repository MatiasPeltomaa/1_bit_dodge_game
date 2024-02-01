extends Node2D

var speed = 200
var rotation_speed = 0

func _ready():
	pass

func _process(delta):
	self.position += Vector2(2.3, 0).rotated(self.rotation)
	
	self.rotation += rotation_speed * delta
	
	if self.global_position.x > 970 || self.global_position.x < 0:
		self.queue_free()
		
	if self.global_position.y > 550 || self.global_position.y < 0:
		self.queue_free()

func _on_bullet_area_area_entered(area):
	if area.name == "player_area":
		self.queue_free()
