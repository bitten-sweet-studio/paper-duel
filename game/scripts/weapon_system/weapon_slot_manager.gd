extends Node
class_name WeaponSlotManager

export var weapon_slot_scene: PackedScene
export var _weapon_slot_count: int = 8
export var radius: float = 50

var _first_valid_slot_index: int = 0
var _handled_weapon: Weapon
var _handled_weapon_slot_index: int
var empty_slots_index = []

enum AttachDirection { CLOCKWISE, COUNTER_CLOCKWISE }


func instantiate_weapon_slots():
	var step = 2 * PI / _weapon_slot_count
	for i in range(_weapon_slot_count):
		var current_weapon_slot = weapon_slot_scene.instance()
		var current_weapon_slot_position = Vector2(radius, 0).rotated(step * i)
		current_weapon_slot.global_position = current_weapon_slot_position
		current_weapon_slot.rotation = current_weapon_slot_position.angle()
		add_child(current_weapon_slot)


func try_start_weapon_attachment(weapon_definition: WeaponDefinition, player):
	var first_valid_slot_index = get_first_valid_slot_index(
		0, AttachDirection.CLOCKWISE, weapon_definition.slots_needed
	)
	if first_valid_slot_index == null:
		return null

	initialize_handled_weapon(weapon_definition, player)
	attach_raw(first_valid_slot_index, AttachDirection.CLOCKWISE)
	return _handled_weapon


func initialize_handled_weapon(weapon_definition: WeaponDefinition, player):
	_handled_weapon = weapon_definition.instance(player)
	return _handled_weapon


func end_weapon_attachment():
	_handled_weapon = null


func move_attachment_previous():
	move_attachment(AttachDirection.COUNTER_CLOCKWISE)


func move_attachment_next():
	move_attachment(AttachDirection.CLOCKWISE)


func move_attachment(direction: int):
	var attach_success: bool = attach_to_first_valid_slot(_handled_weapon_slot_index, direction)
	return attach_success


func attach_raw(slot_index: int, direction: int):
	if !_handled_weapon:
		return false

	_handled_weapon_slot_index = slot_index
	perform_actual_attachment(slot_index, direction)
	update_handled_weapon_transform(slot_index)


func perform_actual_attachment(slot_index: int, direction: int):
	var target_slot = get_slot(slot_index)
	var weapon_parent = _handled_weapon.get_parent()

	if weapon_parent:
		fully_dettach()

	target_slot.attach(_handled_weapon)
	attach_virtually_to_other_slots(slot_index, direction)


func attach_virtually_to_other_slots(start_slot_index: int, direction: int):
	var taken_slots_count = _handled_weapon.definition.slots_needed
	var taken_slots_range = get_slots_indexes_range(start_slot_index, direction, taken_slots_count)

	for i in taken_slots_range:
		if i == start_slot_index:
			continue

		get_slot(i).set_weapon(_handled_weapon)


func fully_dettach():
	var all_slots_indexes_range = get_slots_indexes_range(0, AttachDirection.CLOCKWISE)
	for i in all_slots_indexes_range:
		var current_slot: WeaponSlot = get_slot(i)
		if current_slot.has_given_weapon(_handled_weapon):
			current_slot.dettach()


func update_handled_weapon_transform(slot_index: int):
	var target_slot: WeaponSlot = get_slot(slot_index)
	_handled_weapon.global_position = target_slot.global_position
	_handled_weapon.global_rotation = target_slot.global_rotation


func get_wrapped_slot_index(index: int):
	var result = wrapi(index, 0, _weapon_slot_count)
	return result


func get_slot(index):
	var valid_slot_index = get_wrapped_slot_index(index)
	return get_child(valid_slot_index)


func get_slots_indexes_range(
	start_index_inclusive: int, direction: int, slot_count_cap = _weapon_slot_count
):
	var result := []

	if direction == AttachDirection.CLOCKWISE:
		result = range(start_index_inclusive, start_index_inclusive + slot_count_cap)
	else:
		result = range(start_index_inclusive, start_index_inclusive - slot_count_cap, -1)

	return result


func get_empty_slots_count_until_next_taken_slot(start_index_inclusive: int, direction: int):
	var first_empty_slot_index = get_first_empty_slot_index(start_index_inclusive, direction)

	if first_empty_slot_index == null:
		return null

	var result: int = 1

	var slots_indexes_range: Array = get_slots_indexes_range(first_empty_slot_index, direction)
	for i in slots_indexes_range:
		var current_slot: WeaponSlot = get_slot(i)

		if !current_slot.is_empty():
			return result
		else:
			result += 1

	return result


func get_first_empty_slot_index(start_index_inclusive: int, direction: int):
	var slots_indexes_range: Array = get_slots_indexes_range(start_index_inclusive, direction)

	for i in slots_indexes_range:
		var current_slot: WeaponSlot = get_slot(i)

		if !current_slot.is_empty():
			continue

		return i

	return null


func get_first_valid_slot_index(start_index_inclusive: int, direction: int, slots_needed = null):
	if slots_needed == null:
		slots_needed = get_slots_needed_by_handled_weapon()

	var first_empty_slot_index = get_first_empty_slot_index(start_index_inclusive, direction)
	if first_empty_slot_index == null:
		return null

	var empty_slots_count_until_next_taken_slot = get_empty_slots_count_until_next_taken_slot(
		start_index_inclusive, direction
	)
	if empty_slots_count_until_next_taken_slot <= slots_needed:
		return null

	return first_empty_slot_index


func get_slots_needed_by_handled_weapon():
	return 2


func attach_to_first_valid_slot(start_index_inclusive: int, direction: int):
	var first_valid_slot_index = get_first_valid_slot_index(start_index_inclusive, direction)
	if first_valid_slot_index == null:
		return false

	attach_raw(first_valid_slot_index, direction)
	return true
