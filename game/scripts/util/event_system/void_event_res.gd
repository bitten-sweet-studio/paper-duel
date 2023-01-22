extends Resource
class_name VoidCustomEvent

signal event_signal


func emit():
	emit_signal("event_signal")
