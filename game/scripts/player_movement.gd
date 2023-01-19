extends KinematicBody2D
class_name PlayerMovement

export var speed :float = 500.0

export var _move_left_input : String
export var _move_right_input : String
export var _move_up_input : String
export var _move_down_input : String


var velocity

func _physics_process(delta):
	get_movement_input()

	velocity = move_and_slide(velocity * speed)

func get_movement_input():
	velocity = Vector2()
	if Input.is_action_pressed(_move_right_input):
		velocity.x = 1
	if Input.is_action_pressed(_move_left_input):
		velocity.x = -1
	if Input.is_action_pressed(_move_down_input):
		velocity.y = 1
	if Input.is_action_pressed(_move_up_input):
		velocity.y = -1

func set_movement_inputs(
left_input,
right_input,
up_input ,
down_input):

	_move_left_input = left_input
	_move_right_input = right_input
	_move_up_input  = up_input
	_move_down_input = down_input
