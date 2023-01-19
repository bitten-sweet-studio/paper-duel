extends Node2D

export var number_of_players = 2
export var players_spawn_position_path : NodePath = ("players_spawn_positions")
export var players_path : NodePath = ("players")
export var card_timer_path : NodePath = ("card_timer")
export var weapon_attachment_timer_path : NodePath = ("weapon_attachment_timer")
export var time_label_path : NodePath = ("time_label")



export var player_scene : PackedScene

onready var players_spawn_position = get_node(players_spawn_position_path)
onready var players = get_node(players_path)
onready var card_timer = get_node(card_timer_path)
onready var weapon_attachment_timer = get_node(weapon_attachment_timer_path)

var is_in_preparation_time: bool
var is_in_card_time: bool
var is_in_weapon_attachment_time: bool
onready var time_label = get_node(time_label_path)

func _process(delta):
	time_label.text = String(card_timer.time_left) 


func _ready():
	reset_players_position()
	start_card_time()

func reset_players_position():
	for i in players.get_child_count():
		players.get_child(i).global_position = players_spawn_position.get_child(i).global_position

func start_card_time():
	print("Starting Card Time!")
	is_in_preparation_time = true
	is_in_card_time = true
	card_timer.start()
	#Handle Card Functions

func start_weapon_attachment_time():
	is_in_card_time = false
	is_in_weapon_attachment_time = true
	weapon_attachment_timer.start()
	#Handle Weapon Attachment Functions
	
func _on_card_timer_timeout():
	is_in_card_time = false
	start_weapon_attachment_time()
	print("Card Time has gone!")
	print("Starting Weapon Attachment Time!")

func _on_weapon_attachment_timer_timeout():
	is_in_weapon_attachment_time = false

	print("Weapon Attachment Time has gone!")
	print("Starting Fight Time!")
