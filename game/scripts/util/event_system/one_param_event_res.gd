extends Resource
class_name OneParamCustomEvent

signal event_signal(value)


func emit(value):
	emit_signal("event_signal", value)
