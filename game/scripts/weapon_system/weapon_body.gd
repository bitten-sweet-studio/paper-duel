extends Node2D
class_name WeaponBody

@export var tip_path: NodePath


func get_tip():
	var result = get_node(tip_path)
	return result
