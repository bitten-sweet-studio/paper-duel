extends Node

@export var fire_rates_refs := []
var _card


func setup(card):
	_card = card
	var weapon_fire_rate = _card.weapon_definition.fire_rate_per_second
	for i in get_child_count():
		var should_enable_child_indicator: bool = weapon_fire_rate >= fire_rates_refs[i]
		get_child(i).visible = should_enable_child_indicator
