extends KinematicBody2D
class_name Bullet

export var definition: Resource

var direction: Vector2
var speed: float
var weapon: Weapon


func _init(p_definition, p_weapon):
	definition = p_definition
	weapon = p_weapon

	var body = definition.body_scene.instance()
	add_child(body)

	speed = weapon.definition.bullet_base_speed
	set_collision_layers()

func custom_update(delta: float):
	update_definition(delta)

	var raw_acceleration_per_update = weapon.definition.bullet_raw_acceleration_per_update
	var acceleration_multiplier_per_update = weapon.definition.bullet_acceleration_multiplier_per_update
	speed = ((speed + raw_acceleration_per_update) * acceleration_multiplier_per_update)

	#var min_spread_radians: float = ((-angle/2)* 0.0174533
	#var max_spread_radians: float = (angle/2)*0.0174533
	#var spread_radians: float = RangeUtil.random(min_spread_radians, max_spread_radians)
	#var temp_direction = direction.rotated()
	var movement: Vector2 = speed * direction * delta

	move_and_slide(movement)
	#get_slide_collision()


func update_definition(delta: float):
	definition.custom_update(self, delta)
	
func set_collision_layers():
	self.set_collision_layer_bit(3, true)
	self.set_collision_layer_bit(0, false)
	self.set_collision_mask_bit(1, true)
	self.set_collision_mask_bit(0, false)

func destroy():
	weapon.unregister_bullet(self)
	self.queue_free()
