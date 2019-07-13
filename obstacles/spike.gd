extends Area2D


var defines = preload("res://matrix/Defines.gd")

func canEnter(state):
	print("Checking Tree")
	print("Got state:", state)
	#check if face is correct
	var canmove = state == defines.Faces.Axe
	if canmove:
		get_parent().queue_free()		
	return canmove
