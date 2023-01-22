extends Node
class_name CardHand

export var _current_hovered_card_index: int = 0

var _player


func setup(player):
	_player = player
	hover_by_index(_current_hovered_card_index)


func hover_previous():
	hover_by_offset(-1)


func hover_next():
	hover_by_offset(+1)


func hover_by_offset(offset: int):
	hover_by_index(_current_hovered_card_index + offset)
	pass


func hover_by_index(index: int):
	if !has_cards():
		return

	set_hover_state_by_index(_current_hovered_card_index, false)
	set_hover_state_by_index(index, true)
	_current_hovered_card_index = index


func set_hover_state_by_index(index: int, value: bool):
	var card: Card = get_card_by_index(index)
	card.set_hover_state(value)


func get_card_by_index(index: int):
	if !has_cards():
		return null
	index = wrapi(index, 0, get_child_count())
	var result: Card = get_child(index)
	return result


func get_current_card() -> Card:
	var result: Card = get_card_by_index(_current_hovered_card_index)
	return result


func has_cards():
	var result: bool = get_child_count() >= 1
	return result


func destroy_card(card):
	remove_child(card)
	card.queue_free()


func buy_card(cost: int):
	destroy_card(get_current_card())
	hover_by_index(0)
	_player.currency_agent.spend(cost)
