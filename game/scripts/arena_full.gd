extends Node2D

export var number_of_players = 2
export var players_spawn_position_path : NodePath = ("players_spawn_positions")
export var players_path : NodePath = ("players")
export var player_scene : PackedScene

onready var players_spawn_position = get_node(players_spawn_position_path)
onready var players = get_node(players_path)


func _ready():
	reset_players_position()


func reset_players_position():
	for i in players.get_child_count():
		players.get_child(i).global_position = players_spawn_position.get_child(i).global_position



#func instantiate_players():
	#for i in number_of_players:
		#var current_player = player_scene.instance()
		#players.add_child(current_player)
