extends Node
class_name CardHand

export var cards_begin_path: NodePath
export var cards_end_path: NodePath
export var card_template_scene: PackedScene
export var possible_weapon_definition := []
export var cards_offset: Vector2 = Vector2(10, 10)
export var card_count: int = 5
export var _current_hovered_card_index: int = 0

onready var cards_begin: Node2D = get_node(cards_begin_path)
onready var cards_end: Node2D = get_node(cards_end_path)

var _player


func setup(player):
	_player = player
	create_initial_cards()


func _ready():
	hover_by_index(_current_hovered_card_index)


func _process(delta: float):
	if !has_cards():
		return
	organize_cards()


func organize_cards():
	var cards_begin_gpos = cards_begin.global_position
	var cards_end_gpos = cards_end.global_position
	var cards_count = get_cards_count()

	var cards_h_offset = abs(cards_end_gpos.x - cards_begin_gpos.x) / cards_count
	var cards_v_offset = abs(cards_end_gpos.y - cards_begin_gpos.y) / cards_count
	var card_offset = Vector2(cards_h_offset, cards_v_offset)

	for i in get_cards_count():
		var card_gpos = cards_begin_gpos + (card_offset * i)
		get_card_by_index(i).global_position = card_gpos


func get_cards_count():
	return $cards.get_child_count()


func create_initial_cards():
	for i in card_count:
		create_child_card()


func create_child_card():
	var weapon_definition = get_weapon_definition()
	var card = card_template_scene.instance()
	card.setup(weapon_definition)
	add_card(card)
	


func add_card(card):
	$cards.add_child(card)


func get_weapon_definition():
	var weapon_def_index: int = randi() % possible_weapon_definition.size()
	return possible_weapon_definition[weapon_def_index]


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
	var card = get_card_by_index(index)
	card.set_hover_state(value)


func get_card_by_index(index: int):
	index = wrapi(index, 0, get_cards_count())
	var result = $cards.get_child(index)
	return result


func get_current_card():
	var result = get_card_by_index(_current_hovered_card_index)
	return result


func has_cards():
	return get_cards_count() > 0


func remove_card(card):
	$cards.remove_child(card)


func destroy_card(card):
	card.queue_free()


func destroy_card_index(index: int):
	var card = get_card_by_index(index)
	remove_card(card)
	destroy_card(card)


func buy_card(cost: int):
	destroy_card_index(_current_hovered_card_index)
	hover_by_index(0)
	_player.currency_agent.spend(cost)
