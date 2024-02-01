extends Node2D

var level_1: Node2D
var level_2: Node2D
var level_3: Node2D

var win_screen: Sprite2D

func _ready():
	$levels.queue_free()
	level_1 = load("res://scenes/level_1.tscn").instantiate()
	add_child(level_1)

func _process(_delta):
	if !has_node("player"):
		get_tree().reload_current_scene()

func _on_level_changer_timeout():
	if has_node("level_1"):
		$level_1.queue_free()
		level_2 = load("res://scenes/level_2.tscn").instantiate()
		add_child(level_2)

func _on_level_changer_2_timeout():
	if has_node("level_2"):
		$level_2.queue_free()
		level_3 = load("res://scenes/level_3.tscn").instantiate()
		add_child(level_3)

func _on_level_changer_3_timeout():
	$level_3.queue_free()
	win_screen = load("res://scenes/win.tscn").instantiate()
	add_child(win_screen)
	$boss_music.stop()
	$win_music.play()

func _on_back_to_menu_changer_timeout():
	get_tree().reload_current_scene()
