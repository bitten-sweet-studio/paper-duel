extends Node2D
class_name Player

export var speed: float = 500.0
export var input_definition: Resource

export var _card_hand_path: NodePath = "card_hand"
export var _movement_path: NodePath = "player_body"
export var _weapon_slot_manager_path: NodePath = "player_body/weapon_slots"
export var _state_machine_path: NodePath = "state_machine"
export var _currency_agent_path: NodePath = "currency_agent"
export var weapon_slot: PackedScene 
export var _weapon_slot_count : int


onready var weapon_slot_manager = get_node(_weapon_slot_manager_path)
onready var card_hand: CardHand = get_node(_card_hand_path)
onready var movement = get_node(_movement_path)
onready var _state_machine = get_node(_state_machine_path)
onready var currency_agent = get_node(_currency_agent_path)

func _ready():
	movement.setup(self)
	_state_machine.setup()
	weapon_slot_manager.instantiate_weapon_slots()
