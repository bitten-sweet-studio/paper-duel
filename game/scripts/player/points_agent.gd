extends Node

var max_points: int = 3
var current_points: int = 0
var _player

func setup(player):
	_player = player
	_player.died_event.connect("event_signal",self, "handle_loss")

func handle_victory():
	set_points(current_points + 1)
	print(_player.name + "Wins!!!")
	pass

func handle_loss(amogus):
	print(_player.name + "Loses!!!")
	pass

func increase_points():
	set_points(current_points + 1)

func set_points(points: int):
	current_points = points
	if current_points > max_points:
		set_points(max_points)
	emit_points_changed_event()

func emit_points_changed_event():
	var result: String = "Points: " + str(current_points) + "/" + str(max_points)
	_player.points_changed_event.emit(result)


