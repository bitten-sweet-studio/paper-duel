extends KinematicBody2D

var movement_direction := Vector2()
var velocity := Vector2 ()
export var speed :float = 500.0

export var move_left_input : String
export var move_right_input : String
export var move_up_input : String
export var move_down_input : String

func _physics_process(delta):

	get_input()
	velocity = move_and_slide(velocity * speed)

			
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed(move_right_input):
		velocity.x = 1
	if Input.is_action_pressed(move_left_input):
		velocity.x = -1
	if Input.is_action_pressed(move_down_input):
		velocity.y = 1
	if Input.is_action_pressed(move_up_input):
		velocity.y = -1
		
	
