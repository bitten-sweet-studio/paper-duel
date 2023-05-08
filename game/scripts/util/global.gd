extends Node
class_name Global

var nodes := {}


func register(key, node):
	nodes[key] = node


func get_value(key):
	return nodes[key]
