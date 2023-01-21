extends Node
class_name CardHand

export var _current_hovered_card_index: int = 0

func _ready():
    hover_by_index(_current_hovered_card_index)
    pass

func hover_previous():
    hover_by_offset(+1)

func hover_next():
    hover_by_offset(-1)

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
    index = wrapi(index, 0, get_child_count())
    var result: Card = get_child(index)
    return result

func select_current_card(player) -> Weapon:
    var card: Card = get_card_by_index(_current_hovered_card_index)
    var result: Weapon = card.instantiate_weapon(player)
    return result

func current_card():
    var card: Card = get_card_by_index(_current_hovered_card_index)
    return card

func has_cards():
    var result: bool = get_child_count() >= 1
    return result
