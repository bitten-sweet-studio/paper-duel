extends Node
class_name PlayerManager


func set_is_input_enabled(value: bool):
	for player in get_children():
		player.is_movement_enabled = value
