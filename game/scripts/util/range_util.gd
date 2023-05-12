extends Node
class_name RangeUtil


static func random(p_range: Vector2):
	var result: float = rand_range(p_range.x, p_range.y)
	return result
