extends Area2D

var defines = preload("res://matrix/Defines.gd")

func canEnter(state):
	var chop = state == defines.Faces.Axe
	if chop:
		visible = false
	
	return visible == false