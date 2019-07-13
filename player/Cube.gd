extends Area2D

func _physicis_process():
		var right = Input.is_action_pressed("ui_right");
	var left =  Input.is_action_pressed("ui_left");
	var down = Input.is_action_pressed("ui_down");
	var up = Input.is_action_pressed("ui_up");


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
