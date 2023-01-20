extends Node
class_name WeaponSystem

var _weapons := []


func _physics_process(delta):
	for weapon in _weapons:
		update_weapon(weapon, delta)


func update_weapon(weapon: Weapon, delta: float):
	for bullet in weapon.bullets:
		update_bullet(bullet, delta)


func update_bullet(bullet: Bullet, delta: float):
	update_bullet_traits(bullet, delta)
	update_bullet_physics(bullet, delta)


func update_bullet_traits(bullet: Bullet, delta: float):
	for trait in bullet.definition.traits:
		trait.update(bullet, delta)


func update_bullet_physics(bullet: Bullet, delta: float):
	var new_speed: float = (
		(bullet.speed + bullet.definition.raw_acceleration_per_process)
		* bullet.definition.acceleration_multiplier_per_process
		* delta
	)
	bullet.position += new_speed * bullet.direction


func register(weapon: Weapon):
	_weapons.append(weapon)
	pass


func unregister(weapon: Weapon):
	var weapon_index = _weapons.find(weapon)
	if weapon_index == -1:
		return

	_weapons.remove(weapon_index)
