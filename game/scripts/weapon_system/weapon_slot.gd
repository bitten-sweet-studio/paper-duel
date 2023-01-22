extends Node2D
class_name WeaponSlot

var _weapon: Weapon
var _is_weapon_actually_attached: bool


func attach(weapon: Weapon) -> bool:
	if !is_empty():
		return false

	set_weapon(weapon)
	add_child(_weapon)
	_is_weapon_actually_attached = true
	return true


func dettach():
	if is_empty():
		return false

	if _is_weapon_actually_attached:
		remove_child(_weapon)

	var dettached_weapon = _weapon
	set_weapon(null)
	_is_weapon_actually_attached = false

	return dettached_weapon


func set_weapon(weapon: Weapon):
	_weapon = weapon


func is_empty() -> bool:
	return _weapon == null


func has_given_weapon(weapon) -> bool:
	var result: bool = _weapon == weapon
	return result
