extends Node
class_name Bullet

export var definition: Resource

var owner_weapon: Weapon
var direction: Vector2
var speed: Vector2


func _init(p_definition: BulletDefinition, p_owner_weapon: Weapon):
	definition = p_definition
	owner_weapon = p_owner_weapon
