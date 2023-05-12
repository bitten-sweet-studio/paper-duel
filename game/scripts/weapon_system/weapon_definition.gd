extends Resource
class_name WeaponDefinition

export var name: String = "Weapon"
export var body_scene: PackedScene
export var icon: Texture
export var traits := []
export var damage: float = 1.0
export var cost: int = 1
export var slots_needed: int = 1
export var bounces_left: int = 1
export var fire_rate_per_second: float = 1
export var spread_angle_range: Vector2 = Vector2(15, 20)
export var bullet_base_speed: float = 100
export var bullet_raw_acceleration_per_update: float = 0
export var bullet_acceleration_multiplier_per_update: float = 1
export var bullets_per_burst_range: Vector2 = Vector2.ONE
export var burst_fire_rate_per_second: float = 0.1
export var bullets_definition := []
export var bullets_per_shot_range: Vector2 = Vector2.ONE
export var bullets_spread_range: Vector2 = Vector2.ZERO


func instance(player):
	var result = Weapon.new(player, self)
	return result


func update(owner, delta: float):
	for trait in traits:
		trait.update(owner, delta)
