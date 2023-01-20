extends KinematicBody2D
class_name PlayerMovement

export var speed :float = 500.0

export var _movement_input_definition : Resource


var velocity

func _physics_process(delta):
	get_movement_input()

	velocity = move_and_slide(velocity * speed)

func get_movement_input():
	velocity = Vector2()
	if Input.is_action_pressed(_movement_input_definition.right_input):
		velocity.x = 1
	if Input.is_action_pressed(_movement_input_definition.left_input):
		velocity.x = -1
	if Input.is_action_pressed(_movement_input_definition.down_input):
		velocity.y = 1
	if Input.is_action_pressed(_movement_input_definition.up_input):
		velocity.y = -1

func set_movement_inputs(movement_input_definition):
	_movement_input_definition = movement_input_definition
	
