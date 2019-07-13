extends Area2D

var defines = preload("res://matrix/Defines.gd")

func canEnter(state):
	var player = get_node("../Cube")
	if player.hasKey():
		visible = false
	
	return !visible