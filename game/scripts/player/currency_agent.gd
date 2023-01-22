extends Node

export var max_currency: int = 2
export var current_currency: int = 2
var _player


func setup(player):
	_player = player
	emit_currency_changed_event()


func increase_max_currency(extra_currency_per_round: int = 1):
	max_currency += extra_currency_per_round
	_set_currency(max_currency)


func receive_currency(currency_to_be_received: int):
	_set_currency(current_currency + currency_to_be_received)


func spend(currency_to_be_loss: int):
	if current_currency < currency_to_be_loss:
		return false
	_set_currency(current_currency - currency_to_be_loss)

	return currency_to_be_loss


func _set_currency(currency_to_be_set: int):
	current_currency = currency_to_be_set
	emit_currency_changed_event()


func can_afford(amount: int):
	var result = current_currency >= amount
	return result


func emit_currency_changed_event():
	var result: String = "$ " + str(current_currency)
	_player.currency_changed_event.emit(result)
