extends KinematicBody2D

export var speed :float = 500.0

export var move_left_input : String
export var move_right_input : String
export var move_up_input : String
export var move_down_input : String

export var suffix : String
export var is_in_preparation : bool = true

onready var card_left_input : String = move_left_input
onready var card_right_input : String = move_right_input
onready var arena_full = get_tree().root.get_node("arena_full")

var movement_direction := Vector2()
var velocity := Vector2 ()
var current_hp = 3
var card_hand : CardHand

func _ready():
    card_hand = arena_full.get_node("card_hand_" + suffix)

func _physics_process(delta):
    if is_in_preparation:
        process_card_input()
    else:
        get_movement_input()
        velocity = move_and_slide(velocity * speed)

func get_movement_input():
    velocity = Vector2()
    if Input.is_action_pressed(move_right_input):
        velocity.x = 1
    if Input.is_action_pressed(move_left_input):
        velocity.x = -1
    if Input.is_action_pressed(move_down_input):
        velocity.y = 1
    if Input.is_action_pressed(move_up_input):
        velocity.y = -1

func process_card_input():
    if Input.is_action_just_pressed(card_left_input):
        card_hand.go_left()
    elif Input.is_action_just_pressed(card_right_input):
        card_hand.go_right()

func _on_Area2D_area_entered(area):
    call_deferred("reparent", area)
    
func reparent(node):
    node.get_child(0).disabled = true
    arena_full.remove_child(node)
    add_child(node)
    node.global_position = global_position

func take_damage(damage):
    if current_hp <= 0:
        queue_free()
    current_hp -= damage
