extends Node
class_name MatchStateMachine

enum State { PREP, FIGHTING }

export var prep_state_path: NodePath = "prep_state"
export var fighting_state_path: NodePath = "fighting_state"
export var match_state_text_event: Resource

onready var prep_state = get_node("prep_state")
onready var fighting_state = get_node("fighting_state")

onready var states := {
	State.PREP: prep_state,
	State.FIGHTING: fighting_state,
}

var current_state: int = State.PREP
var state_machine: StateMachine


func _ready():
	state_machine = StateMachine.new()
	state_machine.setup(self, State.PREP, states)


func _process(delta: float):
	state_machine.update(delta)


func change_state(new_state_key: int):
	state_machine.change_state(new_state_key)
