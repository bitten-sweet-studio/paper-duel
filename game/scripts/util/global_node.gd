extends Node

@export var key: String
@export var path: NodePath


func _ready():
	var node = get_node(path)
	global.register(key, node)
