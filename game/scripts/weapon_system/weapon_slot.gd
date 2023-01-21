extends Node2D
class_name WeaponSlot

var _weapon: Weapon

var index

func attach(weapon: Weapon) -> bool:
	if has_weapon():
		return false
		
	_weapon = weapon
	add_child(_weapon)
	return true

func dettach():
	if !has_weapon():
		return false
	remove_child(_weapon)
	var dettached_weapon = _weapon
	_weapon = null
	return dettached_weapon

func has_weapon() -> bool:
	return _weapon != null



func get_weapon() -> Weapon:
	return _weapon
	

	
