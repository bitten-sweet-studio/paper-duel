extends Node2D
class_name WeaponSlot

var _weapon: Weapon

func attach(weapon: Weapon) -> bool:
	if has_weapon():
		return false
		
	_weapon = weapon
	add_child(_weapon)
	return true

func has_weapon() -> bool:
	return _weapon != null

func get_weapon() -> Weapon:
	return _weapon
