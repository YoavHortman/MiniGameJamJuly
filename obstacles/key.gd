extends Area2D

func _on_Key_area_entered(area):
	get_parent().queue_free();
	
func canEnter(state):
	return true;