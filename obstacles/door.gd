extends Area2D

var defines = preload("res://matrix/Defines.gd")

func canEnter(state):
	var player = get_node("../Cube")
	if player.hasKey() && state == defines.Faces.Key:
		visible = false
		get_tree().change_scene("res://GameOver/GameOver.tscn")
	return !visible