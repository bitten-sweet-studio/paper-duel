extends Node

onready var arena_full = get_tree().root.get_child(0)
onready var period_manager = arena_full.get_node("period_manager")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
