extends Node2D
class_name Weapon

export var definition: Resource

var has_traits: bool

var fire_cooldown: float
var fire_cooldown_timer: float

var current_burst_cooldown: float
var current_burst_bullets_left: int
var current_burst_cooldown_timer: float
var body

var _bullets := []
var _player


func _init(player, p_definition):
	_player = player
	definition = p_definition

	has_traits = definition.traits.size()
	fire_cooldown = 1.0 / definition.fire_rate_per_second

	body = definition.body_scene.instance()
	add_child(body)


func custom_update(delta: float):
	update_bullets(delta)
	update_traits(delta)
	handle_current_burst(delta)
	handle_shots(delta)


func handle_current_burst(delta: float):
	if current_burst_bullets_left <= 0:
		return

	current_burst_cooldown_timer += delta

	if current_burst_cooldown_timer >= current_burst_cooldown:
		current_burst_cooldown_timer = 0
		shoot_bullet()
		current_burst_bullets_left -= 1
	else:
		current_burst_cooldown_timer += delta


func handle_shots(delta: float):
	fire_cooldown_timer += delta

	if fire_cooldown_timer >= fire_cooldown:
		fire_cooldown_timer = 0
		shoot()
	else:
		fire_cooldown_timer += delta


func update_bullets(delta: float):
	for bullet in _bullets:
		bullet.custom_update(delta)


func update_traits(delta: float):
	for trait in definition.traits:
		trait.custom_update(self, delta)


func register_bullet(bullet):
	_bullets.append(bullet)


func unregister_bullet(bullet):
	_bullets.erase(bullet)


func shoot():
	var bullets_per_burst_range = definition.bullets_per_burst_range
	if bullets_per_burst_range.x <= 0 or bullets_per_burst_range.y <= 0:
		return

	var burst_bullets_count_raw: float = RangeUtil.random(
		Vector2(bullets_per_burst_range.x, bullets_per_burst_range.y)
	)
	var burst_bullet_count: int = round(burst_bullets_count_raw)

	if burst_bullet_count > 1:
		shoot_burst(burst_bullet_count)
	else:
		shoot_bullet()


func shoot_burst(bullet_count: int):
	current_burst_cooldown = 1.0 / definition.burst_fire_rate_per_second
	current_burst_cooldown_timer = 0
	current_burst_bullets_left = bullet_count


func shoot_bullet():
	var bullet = definition.bullets_definition[0].instance(self)
	_bullets.append(bullet)

	_player.weapon_user.register_bullet(bullet)

	bullet.global_position = body.get_tip().global_position
	var direction: Vector2 = Vector2.RIGHT.rotated(global_rotation)
	direction = add_spread(direction)

	bullet.direction = direction

func add_spread(direction: Vector2) -> Vector2:
	var spread_radians_range: Vector2 = Vector2(
		deg2rad(-definition.spread_angle_range.x), deg2rad(definition.spread_angle_range.y)
	)

	var spread_radians: float = RangeUtil.random(spread_radians_range)
	direction = direction.rotated(spread_radians)

	return direction
