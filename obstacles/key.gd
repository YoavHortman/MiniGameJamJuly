extends Area2D


func _on_Key_area_entered(area):
	if visible:
		visible = false
	return true;