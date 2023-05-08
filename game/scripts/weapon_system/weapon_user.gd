extends Node
class_name WeaponUser

@export var _bullets_parent: Node2D

var _weapons : Array[Weapon] = []


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
	_weapons.erase(weapon)
