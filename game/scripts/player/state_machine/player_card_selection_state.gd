extends Node
class_name PlayerCardSelectionState

export var input_definition: Resource

var _state_machine: PlayerStateMachine
var _player


func enter(state_machine):
	_state_machine = state_machine
	_player = _state_machine.player
	_player.movement.is_movement_enabled = false
	input_definition = _player.input_definition

	print("Card selection begun")


func update(_delta: float):
	handle_input()


func physics_update(_delta: float):
	pass


func handle_input():
	if Input.is_action_just_pressed(input_definition.right_input):
		_player.card_hand.hover_next()

	elif Input.is_action_just_pressed(input_definition.left_input):
		_player.card_hand.hover_previous()

	elif Input.is_action_just_pressed(input_definition.interact):
		handle_interact_input()


func handle_interact_input():
	var card: Card = _player.card_hand.get_current_card()
	var weapon_cost = get_weapon_cost(card.weapon_definition)

	if !_player.currency_agent.can_afford(weapon_cost):
		handle_currency_not_enough()
		return

	var weapon = _player.weapon_slot_manager.try_start_weapon_attachment(
		card.weapon_definition, _player
	)
	if weapon == null:
		return

	_player.weapon_user.register_weapon(weapon)

	_player.card_hand.current_card().queue_free()
	_state_machine.change_state(PlayerStateMachine.State.WEAPON_ATTACHMENT)


func exit():
	pass


func get_weapon_cost(weapon_definition: WeaponDefinition) -> int:
	return 2
	#return weapon_definition.cost


func handle_currency_not_enough():
	#Play animations ( weapon too expensive )
	print("Currency not enough!")
