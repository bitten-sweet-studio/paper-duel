extends Node
class_name Card

export var weapon_definition: Resource
export var border_path: NodePath
export var sprite_path: NodePath
export var name_label_path: NodePath
export var cost_label_path: NodePath
export var speed_widget_path: NodePath
export var fire_rate_widget_path: NodePath

onready var border: CanvasItem = get_node(border_path)
onready var sprite: Sprite = get_node(sprite_path)
onready var name_label: Label = get_node(name_label_path)
onready var cost_label: Label = get_node(cost_label_path)
onready var speed_widget = get_node(speed_widget_path)
onready var fire_rate_widget = get_node(fire_rate_widget_path)


func setup(p_weapon_definition):
	weapon_definition = p_weapon_definition


func _ready():
	sprite.texture.image = weapon_definition.icon
	name_label.text = weapon_definition.name
	cost_label.text = str(weapon_definition.cost)

	speed_widget.setup(self)
	fire_rate_widget.setup(self)


func set_hover_state(value: bool) -> void:
	border.visible = value


func instantiate_weapon(player) -> Weapon:
	var result = weapon_definition.instance(player)
	return result
