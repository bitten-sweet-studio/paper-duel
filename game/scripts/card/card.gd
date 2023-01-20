extends Node
class_name Card

export var weapon_definition: Resource
export var border_path: NodePath

onready var border: CanvasItem = get_node(border_path)


func set_hover_state(value: bool) -> void:
	border.visible = value


func instantiate_weapon() -> Weapon:
	var result = weapon_definition.instantiate_weapon()
	return result
