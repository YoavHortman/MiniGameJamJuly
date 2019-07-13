extends Area2D


var defines = preload("res://matrix/Defines.gd")

func canEnter(state):
	print("Checking Spike")
	print("Got state:", state)
	#check if face is correct
	
	var gameover = state != defines.Faces.Jump or defines.Faces.Shield;
	
	if gameover:
		get_tree().change_scene("res://GameOver/GameOver.tscn")
		return false
			
	return true
