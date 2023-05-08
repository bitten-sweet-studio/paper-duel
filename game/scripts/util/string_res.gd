extends Resource
class_name StringRes

@export var value: String

var listeners : Array[Callable] = []


func subscribe(listener: Callable):
	listeners.append(listener)


func unsubscribe(listener: Callable):
	listeners.erase(listener)


func set_value(new_value: String):
	value = new_value
	for listener in listeners:
		listener.call()
