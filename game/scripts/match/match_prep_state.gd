extends Node

export var label_path: NodePath
export var timer_path: NodePath

onready var label: Label = get_node(label_path)
onready var timer: Timer = get_node(timer_path)

var _state_machine: MatchStateMachine


func enter(p_state_machine):
	_state_machine = p_state_machine
	timer.start()
	print("Prep time has begun")


func update(_delta: float):
	label.text = "Prep: " + str(ceil(timer.time_left))


func _on_prep_timer_timeout():
	_state_machine.change_state(MatchStateMachine.State.FIGHTING)
	print("Prep time has ended")


func exit():
	pass
