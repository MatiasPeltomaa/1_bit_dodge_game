extends Node

var game: Node2D
var start_button: Button
var background: Sprite2D
var menu_music: AudioStreamPlayer2D

func _ready():
	pass

func _process(_delta):
	pass

func _on_start_button_pressed():
	$start_button.queue_free()
	$menu_background.queue_free()
	$menu_music.queue_free()
	$press_space.queue_free()
	game = load("res://scenes/game.tscn").instantiate()
	add_child(game)
