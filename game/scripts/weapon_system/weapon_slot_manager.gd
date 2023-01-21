extends Node
class_name WeaponSlotManager

export var weapon_slot_scene : PackedScene
export var _weapon_slot_count : int = 8
export var radius = 50

var _first_valid_slot_index: int = 0
var _handled_weapon: Weapon
var _handled_weapon_slot_index: int
var target_slot : WeaponSlot
var empty_slots_index = []

func instantiate_weapon_slots():
	var step = 2 * PI / _weapon_slot_count
	for i in range(_weapon_slot_count):
		var current_weapon_slot = weapon_slot_scene.instance()
		var current_weapon_slot_position = Vector2(radius, 0).rotated(step * i)
		current_weapon_slot.global_position = current_weapon_slot_position
		current_weapon_slot.rotation = current_weapon_slot_position.angle()
		current_weapon_slot.index = i
		add_child(current_weapon_slot)

func end_weapon_attachment():
	_handled_weapon = null
	pass
	
func attach_previous():
	attach_by_offset(-1)

func attach_next():
	attach_by_offset(+1)

func attach_by_offset(offset: int):
	attach_weapon(_handled_weapon_slot_index + offset)

func attach_weapon(slot_index: int):
	if !_handled_weapon:
		return

	slot_index = get_first_empty_slot_index(slot_index)
	
	target_slot = get_child(slot_index)
	var weapon_parent = _handled_weapon.get_parent()

	if weapon_parent:
		reparent(_handled_weapon, target_slot)
	else:
		attach_to_first_empty_valid_slot()
		
	_handled_weapon_slot_index = slot_index
	
	update_handled_weapon_transform()

func update_handled_weapon_transform():
	_handled_weapon.global_position = target_slot.global_position
	_handled_weapon.global_rotation = target_slot.global_rotation

func get_valid_slot_index(index: int):
	var result = wrapi(index, 0, _weapon_slot_count)
	return result

func reparent(current_weapon, target_slot):
	var current_slot = current_weapon.get_parent()
	current_slot.dettach()
	target_slot.attach(current_weapon)
#
# Pseudo-code 
#
func get_slot(index):
	var valid_slot_index = get_valid_slot_index(index)
	return get_child(valid_slot_index)
	
func initialize_handled_weapon(weapon: Weapon):
	_handled_weapon = weapon
	
func get_slots_indexes_range(start_index):
	var range_to_be_checked = range(start_index, start_index + _weapon_slot_count)
	return range_to_be_checked
	
func get_first_empty_slot_index(start_index: int):
	var range_to_be_checked = get_slots_indexes_range(start_index)
	for i in range_to_be_checked:
		if !get_slot(i).has_weapon():
			return i
	return null

func get_empty_slots_count_until_next_taken_slot(start_index):
	var first_empty_slot_index : int = get_first_empty_slot_index(start_index)
	
	if first_empty_slot_index == null:
		return false
		
	var result = 1

	for i in get_slots_indexes_range(first_empty_slot_index):
		var current_slot = get_slot(i)
		if current_slot.has_weapon():
			return result
		else:
			result +=1

	return result
	
func get_slots_needed_for_handled_weapon():
	return 2 ## HARDCODED
func get_next_slot_that_supports_current_weapon():
	var slots_needed = get_slots_needed_for_handled_weapon()
	var start_index = 0
	for attempt_count in _weapon_slot_count/slots_needed:
		if get_empty_slots_count_until_next_taken_slot(start_index) >= slots_needed:
			return get_slot(start_index) 
		else:
			start_index += slots_needed
	return false
	
func attach_to_first_empty_valid_slot():
	var first_empty_valid_slot = get_next_slot_that_supports_current_weapon()
	first_empty_valid_slot.attach(_handled_weapon)
	
func start_weapon_attachment(weapon: Weapon):
	#if !get_next_slot_that_supports_current_weapon(): #If theres space for handled weapon
		#return false
		
	initialize_handled_weapon(weapon)
	attach_to_first_empty_valid_slot()
#
# Pseudo-code 
#
