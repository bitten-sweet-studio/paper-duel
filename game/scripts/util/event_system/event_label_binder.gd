extends Node

export var event: Resource
export var label_path: NodePath = "."


func _ready():
	event.connect("event_signal", self, "update_label")


func update_label(text: String):
	var label: Label = get_node(label_path)
	label.text = text
