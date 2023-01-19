extends Node
class_name CardHand

var curr_card_index : int = 0
var card_count : int

func _ready():
    card_count = get_child_count()

func go_left():
    go_by_offset(-1)
    
func go_right():
    go_by_offset(+1)

func go_by_offset(offset: int):
    var temp_curr_card_index = wrapi(curr_card_index, 0, card_count)
    var target_index = wrapi(curr_card_index + offset, 0, card_count)

    var curr_child_card: Node = get_child(temp_curr_card_index)
    var target_child_card: Node = get_child(target_index)

    set_border(curr_child_card, false)
    set_border(target_child_card, true)

    curr_card_index += offset

func set_border(card, value):
    var card_border = card.get_node("border")
    card_border.visible = value

func toggle_border(card):
    var card_border = card.get_node("border")
    card_border.visible = !card_border.visible
