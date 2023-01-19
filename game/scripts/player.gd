extends Node2D
class_name Player

export var speed :float = 500.0

export var move_left_input : String
export var move_right_input : String
export var move_up_input : String
export var move_down_input : String
export var player_body_path : NodePath = ("player_body")

onready var player_body : PlayerMovement = get_node(player_body_path)

func _ready():
	player_body.set_movement_inputs(move_left_input,move_right_input, move_up_input,move_down_input)
