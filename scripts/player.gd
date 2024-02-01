extends Node2D

var base_speed: float = 200
var speed: float = base_speed

var base_rotation_speed = 5.0
var rotation_speed: float = base_rotation_speed

var sprite: Sprite2D = Sprite2D.new()

var hp: int = 3

func _ready():
	sprite = $player_sprite

func _process(delta):
	var movement = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		movement.x += 1
		sprite.rotate(rotation_speed * delta)
	elif Input.is_action_pressed("ui_left"):
		movement.x -= 1
		sprite.rotate(-rotation_speed * delta)
		
	if Input.is_action_pressed("ui_down"):
		movement.y += 1
	elif Input.is_action_pressed("ui_up"):
		movement.y -= 1
		
	if Input.is_action_pressed("ui_select"):
		speed = base_speed / 2
		rotation_speed = base_rotation_speed / 2
	else:
		speed = base_speed
		rotation_speed = base_rotation_speed
	
	self.position += movement * speed * delta
	
	position.x = clamp(position.x, 0, 960)
	position.y = clamp(position.y, 0, 540)

func _on_player_area_area_entered(area):
	if area.name == "bullet_area" and hp == 3:
		self.scale.x -= 0.33
		self.scale.y -= 0.33
		hp -= 1
	elif area.name == "bullet_area" and hp == 2:
		self.scale.x -= 0.33
		self.scale.y -= 0.33
		hp -= 1
	elif area.name == "bullet_area" and hp == 1:
		hp -= 1
		self.queue_free()

