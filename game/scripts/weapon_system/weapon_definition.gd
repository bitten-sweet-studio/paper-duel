extends Resource
class_name WeaponDefinition

export var body_scene: PackedScene
export var traits := []
export var bullets_definition := []
export var bullets_per_shot_range: Vector2
export var bullets_spread_range: Vector2


func instantiate_weapon():
	var weapon_root: Weapon = Weapon.new()
	weapon_root.setup(self)

	var body_instance = body_scene.instance()
	weapon_root.add_child(body_instance)

	return weapon_root
