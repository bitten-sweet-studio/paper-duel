extends Node
class_name WeaponSlotManager

@export var weapon_slot_scene: PackedScene
@export var _weapon_slot_count: int = 8
@export var radius: float = 50

var _first_valid_slot_index: int = 0
var _handled_weapon: Weapon
var _handled_weapon_slot_index: int
var empty_slots_index = []

enum AttachDirection { CLOCKWISE, COUNTER_CLOCKWISE }


func instantiate_weapon_slots():
	var step = 2 * PI / _weapon_slot_count
	for i in range(_weapon_slot_count):
		var current_weapon_slot = weapon_slot_scene.instantiate()
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
	_handled_weapon = weapon_definition.instantiate(player)
	return _handled_weapon


func end_weapon_attachment():
	_handled_weapon = null


func move_attachment_previous():
	move_attachment(AttachDirection.COUNTER_CLOCKWISE)


func move_attachment_next():
	move_attachment(AttachDirection.CLOCKWISE)


func move_attachment(direction: int):
	var start_index: int = offset_slot_index(_handled_weapon_slot_index, direction)
	var attach_success: bool = attach_to_first_valid_slot(start_index, direction)

	return attach_success
	
func offset_slot_index(slot_index: int, direction: int, offset: int = 1) -> int:
	var result: int = slot_index

	if direction == AttachDirection.CLOCKWISE:
		result += offset
	else:
		result -= offset
		
	return result


func attach_raw(slot_index: int, direction: int):
	if !_handled_weapon:
		return false

	_handled_weapon_slot_index = slot_index
	perform_actual_attachment(slot_index, direction)
	update_handled_weapon_transform(slot_index)


func perform_actual_attachment(slot_index: int, direction: int):
	var target_slot = get_slot(slot_index)

	fully_dettach()
	target_slot.attach(_handled_weapon)
	attach_virtually_to_other_slots(slot_index, direction)


func attach_virtually_to_other_slots(start_slot_index: int, direction: int):
	start_slot_index = offset_slot_index(start_slot_index, direction)
	var taken_slots_count = get_slots_needed_by_handled_weapon()
	var taken_slots_range = get_slots_indexes_range(start_slot_index, direction, taken_slots_count - 1)

	for i in taken_slots_range:
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
	start_index_inclusive: int, direction: int, extra_slots_count = _weapon_slot_count
):
	var result := []

	if direction == AttachDirection.CLOCKWISE:
		result = range(start_index_inclusive, start_index_inclusive + extra_slots_count)
	else:
		result = range(start_index_inclusive, start_index_inclusive - extra_slots_count, -1)

	return result


func get_first_valid_slot_index(start_index: int, direction: int, slots_needed = null):
	if slots_needed == null:
		slots_needed = get_slots_needed_by_handled_weapon()

	var slots_indexes_range: Array = get_slots_indexes_range(start_index, direction)
	for i in slots_indexes_range:
		var sequential_empty_slots: int = 0

		var temp_slot_indexes_range: Array = get_slots_indexes_range(i, direction, slots_needed)
		for j in temp_slot_indexes_range:
			var current_slot = get_slot(j)
			var slot_has_weapon_virtually_attached = current_slot.has_given_weapon(_handled_weapon) and !current_slot._is_weapon_actually_attached
			
			if current_slot.is_empty() or slot_has_weapon_virtually_attached:
				sequential_empty_slots += 1

				if sequential_empty_slots == slots_needed:
					return i
			else:
				sequential_empty_slots = 0

	return null


func get_slots_needed_by_handled_weapon():
	return _handled_weapon.definition.slots_needed


func attach_to_first_valid_slot(start_index_inclusive: int, direction: int):
	var first_valid_slot_index = get_first_valid_slot_index(start_index_inclusive, direction)
	if first_valid_slot_index == null:
		return false

	attach_raw(first_valid_slot_index, direction)
	return true
