extends Node2D

var bullet_scene = preload("res://scenes/bullet.tscn")
onready var arena_full = get_tree().root.get_node("arena_full")
var player

func _ready():
	player = arena_full.get_node("player")

func _on_Timer_timeout():
	shoot_bullet()

func shoot_bullet():
	if get_parent() == arena_full:
		add_child(bullet_scene.instance()) 
	else:
		get_parent().get_parent().add_child(bullet_scene.instance()) 
