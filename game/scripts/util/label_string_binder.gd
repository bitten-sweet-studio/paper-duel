extends Node

export var string_res: Resource
export var label_path: NodePath = "."

onready var label = get_node(label_path)

func _ready():
    string_res.subscribe()
    pass
