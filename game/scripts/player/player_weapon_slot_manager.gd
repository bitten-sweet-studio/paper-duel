extends Node
class_name WeaponSlotManager


func attach_weapon(weapon_instance: Weapon):
	var target_slot: Node2D = get_child(0)
	target_slot.add_child(weapon_instance)
	weapon_instance.global_position = target_slot.global_position
	weapon_instance.global_rotation = target_slot.global_rotation
