extends Node2D
class_name Weapon

export var definition: Resource

var bullets := []


func setup(p_definition):
	definition = p_definition
	pass
