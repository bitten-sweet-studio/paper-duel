extends Node
class_name StateMachine

var _current_state_key: int = -1
var _states: Dictionary
var _owner

func setup(owner, initial_state_key: int, states: Dictionary):
    _owner = owner
    _states = states
    change_state(initial_state_key)


func update(delta: float):
    _states[_current_state_key].update(delta)


func change_state(new_state_key: int):
    if _current_state_key != -1:
        _states[_current_state_key].exit()

    _current_state_key = new_state_key
    _states[_current_state_key].enter(_owner)
