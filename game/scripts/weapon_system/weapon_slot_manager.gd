extends Node
class_name WeaponSlotManager

export var weapon_slot_scene : PackedScene
export var _weapon_slot_count : int = 8
export var radius = 50

var _first_valid_slot_index: int = 0
var _handled_weapon: Weapon
var _handled_weapon_slot_index: int

func instantiate_weapon_slots():
	var step = 2 * PI / _weapon_slot_count
	for i in range(_weapon_slot_count):
		var current_weapon_slot = weapon_slot_scene.instance()
		var current_weapon_slot_position = Vector2(radius, 0).rotated(step * i)
		current_weapon_slot.global_position = current_weapon_slot_position
		current_weapon_slot.rotation = current_weapon_slot_position.angle()
		add_child(current_weapon_slot)

func start_weapon_attachment(weapon: Weapon):
	_handled_weapon = weapon
	
func end_weapon_attachment():
	_handled_weapon = null
	pass
	
func attach_to_first_valid_slot():
	attach_weapon(_first_valid_slot_index)

func attach_previous():
	attach_by_offset(-1)

func attach_next():
	attach_by_offset(+1)

func attach_by_offset(offset: int):
	attach_weapon(_handled_weapon_slot_index + offset)

func attach_weapon(slot_index: int):
	if !_handled_weapon:
		return

	slot_index = get_valid_slot_index(slot_index)
	
	var target_slot: WeaponSlot = get_child(slot_index)
	var weapon_parent = _handled_weapon.get_parent()
	
	if weapon_parent:
		reparent(_handled_weapon, target_slot)
	else:
		target_slot.add_child(_handled_weapon)
		
	_handled_weapon_slot_index = slot_index
	
	_handled_weapon.global_position = target_slot.global_position
	_handled_weapon.global_rotation = target_slot.global_rotation
	
func get_valid_slot_index(index: int):
	var result = wrapi(index, 0, _weapon_slot_count)
	return result

func reparent(current_node, target_parent):
	var current_node_parent = current_node.get_parent()
	current_node_parent.remove_child(current_node)
	target_parent.add_child(current_node)
