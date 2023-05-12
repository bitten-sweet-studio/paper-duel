extends Node2D
class_name WeaponSlot

export var sprite_path: NodePath
export var sprite_attached_color: Color
export var sprite_attached_virtually_color: Color

onready var sprite: Sprite = get_node(sprite_path)
onready var sprite_default_color: Color = sprite.modulate

var _weapon: Weapon
var _is_weapon_actually_attached: bool


func attach(weapon: Weapon) -> bool:
	if !is_empty():
		return false

	set_weapon(weapon)
	add_child(_weapon)
	_is_weapon_actually_attached = true
	sprite.modulate = sprite_attached_color
	return true


func dettach():
	if is_empty():
		return false

	if _is_weapon_actually_attached:
		remove_child(_weapon)

	var dettached_weapon = _weapon
	set_weapon(null)
	_is_weapon_actually_attached = false
	sprite.modulate = sprite_default_color

	return dettached_weapon


func set_weapon(weapon: Weapon):
	_weapon = weapon
	sprite.modulate = sprite_attached_virtually_color


func is_empty() -> bool:
	return _weapon == null


func has_given_weapon(weapon) -> bool:
	var result: bool = _weapon == weapon
	return result
