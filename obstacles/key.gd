extends Area2D

func _on_Key_area_entered(area):
	print("pickup")

var picked = false
	
func canEnter(state):
	return true;
