extends Node

var max_health : int = 5
var current_health: int = 5

func lose_health(damage: int = 1):
	current_health -= damage
	if (current_health <= 0):
		handle_death()
		
func handle_death():
	print("You Died!")
	pass
	
func gain_health(heal:int = 1):
	current_health += heal
	if current_health > max_health:
		current_health = max_health
		
func set_health(health: int = max_health):
	current_health = health

func increase_max_health(health: int = 1):
	max_health += health

func _on_player_hurtbox_area_entered(area):
	area.get_parent().destroy()
