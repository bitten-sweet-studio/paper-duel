extends Sprite

var movement_direction
var distance_per_frame
var speed = 500
var motion
var damage = 1

func _ready():
	pass
	
func _physics_process(delta):
	self.scale = self.scale * 0.995
	if movement_direction:
		move_bullet(delta)

func move_bullet(_delta):
	distance_per_frame = speed * _delta
	motion = transform.x * distance_per_frame
	position += motion

func set_direction(_direction):
	self.movement_direction = _direction
	rotation = movement_direction.angle()



func _on_Area2D_area_entered(area):
	area.get_parent().take_damage(damage)
	queue_free()
