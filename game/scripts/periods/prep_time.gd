extends Node

onready var fight_time = get_parent().get_node("fight_time")
onready var arena_full = get_tree().root.get_child(0)
onready var period_manager = arena_full.get_node("period_manager")
onready var prep_timer = get_node("prep_timer")

func start():
	prep_timer.start()
	print("Prep time has begun")
	$card_selection_state.start()


func _on_prep_timer_timeout():
	print("Prep time has ended")
	start_fight_time()

func start_fight_time():
		fight_time.start()
