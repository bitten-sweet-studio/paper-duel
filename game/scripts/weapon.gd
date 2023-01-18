extends Node2D

var bullet_scene = preload("res://scenes/bullet.tscn")
onready var arena_full = get_tree().root.get_node("arena_full")
var player
onready var weapon_tip = $weapon_tip
func _ready():
	pass

func _on_Timer_timeout():
	shoot_bullet()

func shoot_bullet():
	var current_bullet = bullet_scene.instance()
	var direction = Vector2.RIGHT.rotated(deg2rad(rotation_degrees))
	current_bullet.set_direction(direction)
	if get_parent() == arena_full:
		add_child(current_bullet) 
	else:
		get_parent().get_parent().add_child(current_bullet) 
	current_bullet.global_position = weapon_tip.global_position 
