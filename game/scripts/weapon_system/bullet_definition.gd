extends Resource
class_name BulletDefinition

export var body_scene: PackedScene
export var traits := []
export var test: float


func instance(weapon):
    var result = Bullet.new(self, weapon)
    return result


func custom_update(bullet, delta: float):
    update_traits(bullet, delta)


func update_traits(bullet, delta: float):
    for trait in traits:
        trait.update(bullet, delta)
