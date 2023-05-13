extends KinematicBody2D
class_name Bullet

export var definition: Resource

var direction: Vector2
var speed: float
var weapon: Weapon
var bounces_left: int


func _init(p_definition, p_weapon):
	definition = p_definition
	weapon = p_weapon

	var body = definition.body_scene.instance()
	add_child(body)

	speed = weapon.definition.bullet_base_speed
	bounces_left = weapon.definition.bounces_left
	set_collision_layers()


func custom_update(delta: float):
	update_definition(delta)

	var raw_acceleration_per_update = weapon.definition.bullet_raw_acceleration_per_update
	var acceleration_multiplier_per_update = weapon.definition.bullet_acceleration_multiplier_per_update
	speed = ((speed + raw_acceleration_per_update) * acceleration_multiplier_per_update)

	var movement: Vector2 = speed * direction * delta

	var collision: KinematicCollision2D = move_and_collide(movement)
	if collision:
		handle_collision(collision)


func handle_collision(collision: KinematicCollision2D):
	try_deal_damage(collision.collider)

	if has_bounces_left():
		bounce(collision)
	else:
		destroy()


func bounce(collision: KinematicCollision2D):
	direction = direction.bounce(collision.normal)
	direction = weapon.add_spread(direction)
	global_rotation = direction.angle()
	bounces_left -= 1


func try_deal_damage(target):
	if !target.has_method("on_hit"):
		return

	target.on_hit(weapon.definition.damage)


func has_bounces_left():
	var result: bool = bounces_left >= 1
	return result


func update_definition(delta: float):
	definition.custom_update(self, delta)


func set_collision_layers():
	self.set_collision_layer_bit(0, false)
	self.set_collision_layer_bit(3, true)

	self.set_collision_mask_bit(0, false)
	self.set_collision_mask_bit(1, true)
	self.set_collision_mask_bit(4, true)


func destroy():
	weapon.unregister_bullet(self)
	self.queue_free()
