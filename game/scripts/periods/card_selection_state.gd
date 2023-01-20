extends Node

onready var arena_full = get_tree().root.get_child(0)
onready var period_manager = arena_full.get_node("period_manager")
export var input_definition : Resource

func start():
	print("Card selection begun")


func update():
	pass
	
##PSEUDO-CODE
##PSEUDO-CODE
var money
var current_card
var current_weapon
var weapon_attachment_state
func get_input():
	if Input.is_action_just_pressed(input_definition.right_input):
		go_right()
	elif Input.is_action_just_pressed(input_definition.left_input):
		go_left()
	elif Input.is_action_just_pressed(input_definition.select):
		try_buy_card()
		
func go_left():
	pass

func go_right():
	pass

func try_buy_card():
	if money >= current_card.price:
		buy_card()
		
func buy_card():
	money -= current_card.price
	current_card.weapon = current_weapon
	current_card.queue_free()
	weapon_attachment_state.start()
##PSEUDO-CODE
##PSEUDO-CODE
