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


func custom_update(delta: float):
    update_definition(delta)

    var raw_acceleration_per_update = weapon.definition.bullet_raw_acceleration_per_update
    var acceleration_multiplier_per_update = weapon.definition.bullet_acceleration_multiplier_per_update
    speed = ((speed + raw_acceleration_per_update) * acceleration_multiplier_per_update)

    var movement: Vector2 = speed * direction * delta

    move_and_slide(movement)
    #get_slide_collision()


func update_definition(delta: float):
    definition.custom_update(self, delta)
