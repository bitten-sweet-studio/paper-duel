extends Sprite

var movement_direction
var distance_per_frame
var speed = 500
var motion

func _ready():
	var direction = Vector2.RIGHT.rotated(deg2rad(rotation_degrees))
	set_direction(direction.rotated(rand_range((-10/2)* 0.0174533, (10/2)*0.0174533)))

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
