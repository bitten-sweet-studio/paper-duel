extends Node2D
class_name Player

export var speed: float = 500.0
export var input_definition: Resource

export var _card_hand_path: NodePath
export var _movement_path: NodePath = "player_body"
export var _weapon_slot_manager: NodePath

onready var card_hand: CardHand = get_node(_card_hand_path)
onready var movement = get_node(_movement_path)
onready var weapon_slot_manager = get_node(_weapon_slot_manager)


func _ready():
	movement.setup(self)
