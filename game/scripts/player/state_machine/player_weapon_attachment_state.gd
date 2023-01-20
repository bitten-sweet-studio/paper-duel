extends Node
class_name PlayerWeaponAttachmentState

export var input_definition: Resource

var _state_machine: PlayerStateMachine
var _player


func enter(owner):
	_state_machine = owner
	_player = _state_machine.player
	_player.movement.is_movement_enabled = false
	input_definition = _player.input_definition
	print("Card selection begun")


func update(_delta: float):
	handle_input()


func handle_input():
	if Input.is_action_just_pressed(input_definition.right_input):
		_player.weapon_slot_manager.attach_next()

	elif Input.is_action_just_pressed(input_definition.left_input):
		_player.weapon_slot_manager.attach_previous()

	elif Input.is_action_just_pressed(input_definition.interact):
		handle_interact_input()


func handle_interact_input():
	_player.weapon_slot_manager.end_weapon_attachment()
	_state_machine.change_state(PlayerStateMachine.State.CARD_SELECTION)


func exit():
	pass

