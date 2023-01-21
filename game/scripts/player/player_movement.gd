extends KinematicBody2D
class_name PlayerMovement

export var is_movement_enabled: bool = true
export var speed: float = 25000.0
export var _input_definition: Resource

var velocity
var _player: Player


func setup(player):
    _player = player
    _input_definition = _player.input_definition


func _physics_process(delta: float):
    move_conditionally(delta)


func move_conditionally(delta: float):
    if !is_movement_enabled:
        return

    move(delta)


func move(delta: float):
    get_movement_input()
    move_and_slide(velocity * speed * delta)


func get_movement_input():
    velocity = Vector2()

    if Input.is_action_pressed(_input_definition.right_input):
        velocity.x = 1

    if Input.is_action_pressed(_input_definition.left_input):
        velocity.x = -1

    if Input.is_action_pressed(_input_definition.down_input):
        velocity.y = 1

    if Input.is_action_pressed(_input_definition.up_input):
        velocity.y = -1
