extends Node

var max_currency : int = 2
var current_currency: int = 2
var _player 

func setup(player):
	_player = player

func _ready():
	print("Initial currency:" + String(current_currency))

func increase_max_currency(extra_currency_per_round: int = 1):
	max_currency += extra_currency_per_round
	_set_currency(max_currency)

func receive_currency(currency_to_be_received: int):
	_set_currency(current_currency + currency_to_be_received)

func spend_currency(currency_to_be_loss: int):
	if current_currency < currency_to_be_loss:
		return false
	_set_currency(current_currency - currency_to_be_loss)


	return currency_to_be_loss
func _set_currency(currency_to_be_set:int ):
	current_currency = currency_to_be_set
	_player.currency_changed_event.emit(String(current_currency))
