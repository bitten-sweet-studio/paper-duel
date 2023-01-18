extends KinematicBody2D

var movement_direction := Vector2()
var velocity := Vector2 ()
export var speed :float = 500.0

export var move_left_input : String
export var move_right_input : String
export var move_up_input : String
export var move_down_input : String

var current_hp = 3


onready var arena_full = get_tree().root.get_node("arena_full")


func _ready():
	print(arena_full)

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity * speed)
	look_at(get_global_mouse_position())

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
		

func _on_Area2D_area_entered(area):
	if area.name != "weapon":
		return
	if has_node("weapon"):
		return
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
