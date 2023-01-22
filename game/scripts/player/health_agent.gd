extends Node

export var max_health: int = 5
export var current_health: int = 5
export var max_health_increase_per_turn: int = 0
export var label_path: NodePath

onready var label: Label = get_node(label_path)

var _player
var is_dead: bool 

func setup(player):
	_player = player
	emit_health_changed_event()

func lose_health(damage: int = 1):
	set_health(current_health - damage)

	if current_health > 0:
		return

	handle_death()


func handle_death():
	if !is_dead:
		_player.points_agent.increase_points()
	is_dead = true
	emit_died_event()


func gain_health(heal: int = 1):
	set_health(current_health + heal)
	if current_health > max_health:
		set_health(max_health)


func set_health(health: int):
	current_health = health
	emit_health_changed_event()


func maximize_health():
	is_dead = false
	set_health(max_health)

func emit_died_event():
	_player.health_changed_event.emit("Died!")
	_player.died_event.emit(1)





func emit_health_changed_event():
	var result: String = str(current_health) + "/" + str(max_health)
	_player.health_changed_event.emit(result)
	label.text = result


func increase_max_health():
	max_health += max_health_increase_per_turn
	maximize_health()


func on_hit(damage: float):
	lose_health(round(damage))
