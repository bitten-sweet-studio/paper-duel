extends Node
class_name PlayerManager

signal player_died(player)

export var weapon_definitions := []


func _ready():
	for i in get_child_count():
		get_child(i).setup(self)


func set_is_input_enabled(value: bool):
	for player in get_children():
		player.is_movement_enabled = value
