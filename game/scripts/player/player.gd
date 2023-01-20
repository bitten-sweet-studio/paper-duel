extends Node2D
class_name Player

export var speed :float = 500.0
export var _movement_input_definition : Resource

export var player_body_path : NodePath = ("player_body")

onready var player_body : PlayerMovement = get_node(player_body_path)

func _ready():
	player_body.set_movement_inputs(_movement_input_definition)
