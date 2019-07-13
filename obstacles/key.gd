extends Area2D

func _on_Key_area_entered(area):
	print("pickup")

signal key_pickup

func canEnter(state):
	if visible:
		var player = get_node("../Cube")
		player.onKeyPickup()
		visible = false
	return true;
