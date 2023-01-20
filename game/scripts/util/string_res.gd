extends Resource
class_name StringRes

export var value: String

var listeners:= []

func subscribe(listener: FuncRef):
    listeners.append(listener)
    
func unsubscribe(listener: FuncRef):
    var listener_index = listeners.find(listener)

    if listener_index == -1:
        return

    listeners.remove(listener_index)

func set_value(new_value: String):
    value = new_value
    for listener in listeners:
        listener.call_func()
