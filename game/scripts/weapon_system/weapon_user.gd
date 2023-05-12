extends Node
class_name WeaponUser

export var _bullets_parent_path: NodePath

onready var _bullets_parent: Node2D = get_node(_bullets_parent_path)

var _weapons := []


func custom_update(delta: float):
	update_weapons(delta)


func update_weapons(delta: float):
	for weapon in _weapons:
		weapon.custom_update(delta)


func register_bullet(bullet):
	_bullets_parent.add_child(bullet)


func unregister_bullet(bullet):
	_bullets_parent.remove_child(bullet)


func register_weapon(weapon):
	_weapons.append(weapon)


func unregister_weapon(weapon: Weapon):
	var weapon_index: int = _weapons.find(weapon)
	if weapon_index >= 0:
		_weapons.remove(weapon_index)
