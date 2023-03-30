extends Node
class_name RangeUtil


static func random(p_range: Vector2):
	var result: float = randf_range(p_range.x, p_range.y)
	return result
