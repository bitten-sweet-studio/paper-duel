extends Node

enum PlayerState {
	CARD_SELECTION,
	WEAPON_ATTACHMENT,
	FIGHTING
}

#var states: Dictionary = {
#	PlayerState.CARD_SELECTION : $card_selection_state,
#	PlayerState.WEAPON_ATTACHMENT : $card_selection_state,
#	PlayerState.FIGHTING : $fighting_state
#}

var current_state: int = PlayerState.CARD_SELECTION

#func _process(delta):
#	pass
