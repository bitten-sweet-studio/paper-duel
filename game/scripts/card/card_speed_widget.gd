extends Node

@export var speeds_refs := []
var _card


func setup(card):
	_card = card
	var weapon_base_speed = _card.weapon_definition.bullet_base_speed
	for i in get_child_count():
		var should_enable_child_indicator: bool = weapon_base_speed >= speeds_refs[i]
		get_child(i).visible = should_enable_child_indicator
