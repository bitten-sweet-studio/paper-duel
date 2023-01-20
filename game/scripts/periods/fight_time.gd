extends Node

onready var arena_full = get_tree().root.get_child(0)
onready var period_manager = arena_full.get_node("period_manager")

func start():
	$fight_timer.start()
	print("The fight has begun!")

func _on_fight_timer_timeout():
	print("Fight time has ended.")
