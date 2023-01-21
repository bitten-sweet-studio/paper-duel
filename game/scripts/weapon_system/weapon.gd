extends Node2D
class_name Weapon

export var definition: Resource

var has_traits: bool
var fire_cooldown: float
var fire_cooldown_timer: float
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
	var bullet = definition.bullets_definition[0].instance(self)
	register_bullet(bullet)

	_player.weapon_user.register_bullet(bullet)

	bullet.global_position = body.get_tip().global_position
	var direction: Vector2 = Vector2.RIGHT.rotated(global_rotation)
	bullet.direction = direction
