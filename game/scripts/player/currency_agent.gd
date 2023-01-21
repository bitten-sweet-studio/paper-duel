extends Node2D

var max_currency : int = 2
var current_currency: int = 2

func _ready():
	print("Initial currency:" + String(current_currency))

func increase_max_currency(extra_currency_per_round: int = 1):
	max_currency += extra_currency_per_round
	current_currency = max_currency
	print("Max currency increased. Currency now -> " +String(current_currency))
func receive_currency(currency_to_be_received: int):
	current_currency += currency_to_be_received

func spend_currency(currency_to_be_loss: int):
	if current_currency < currency_to_be_loss:
		return false
	current_currency -= currency_to_be_loss
	print("Weapon was bought. Currency now -> " +String(current_currency))
	return currency_to_be_loss
func _set_currency(currency_to_be_set:int ):
	current_currency = currency_to_be_set
