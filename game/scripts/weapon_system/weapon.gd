extends Node
class_name Weapon

export var definition: Resource

var bullets := []


func setup(p_definition: WeaponDefinition):
	definition = p_definition
	pass
