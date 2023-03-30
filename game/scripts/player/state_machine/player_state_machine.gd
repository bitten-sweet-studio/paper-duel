extends Node
class_name PlayerStateMachine

enum State { CARD_SELECTION, WEAPON_ATTACHMENT, FIGHTING }

@export var _player_path: NodePath
@export var _card_selection_state_path: NodePath = "card_selection_state"
@export var _weapon_attachment_state_path: NodePath = "weapon_attachment_state"
@export var _fighting_state_path: NodePath = "fighting_attachment_state"

@onready var player = get_node(_player_path)
@onready var card_selection_state = get_node(_card_selection_state_path)
@onready var weapon_attachment_state = get_node(_weapon_attachment_state_path)
@onready var fighting_state = get_node(_fighting_state_path)

@onready var states: Dictionary = {
	State.CARD_SELECTION: card_selection_state,
	State.WEAPON_ATTACHMENT: weapon_attachment_state,
	State.FIGHTING: fighting_state
}

var current_state: int = State.CARD_SELECTION
var state_machine: StateMachine


func setup():
	state_machine = StateMachine.new()
	state_machine.setup(self, State.CARD_SELECTION, states)
	global.get("prep_timer").connect("timeout",Callable(self,"_on_prep_timer_timeout"))
	global.get("fighting_timer").connect("timeout",Callable(self,"_on_fighting_timer_timeout"))


func _process(delta: float):
	state_machine.update(delta)


func _physics_process(delta: float):
	state_machine.physics_update(delta)


func change_state(new_state_key: int):
	state_machine.change_state(new_state_key)


func _on_prep_timer_timeout():
	change_state(State.FIGHTING)


func _on_fighting_timer_timeout():
	player.currency_agent.increase_max_currency()
	player.health_agent.increase_max_health()
	change_state(State.CARD_SELECTION)
