extends Area2D


var defines = preload("res://matrix/Defines.gd")

func canEnter(state):
	print("Checking Spike")
	print("Got state:", state)
	#check if face is correct
	var canmove = state == defines.Faces.Shield
	var canjump = state == defines.Faces.Jump
	if !canmove && !canjump:
		get_tree().change_scene("res://GameOver/GameOver.tscn")
		return false
	if canmove:
		return false;
	if canjump:
		get_node("../Cube").jump();
		return true;

	return false;
