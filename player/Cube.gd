extends Area2D

const STEP_SIZE = 100;
var lastPos = Vector2();
var faceState;
func _physics_process(delta):
	var right = Input.is_action_just_pressed("ui_right");
	var left =  Input.is_action_just_pressed("ui_left");
	var down = Input.is_action_just_pressed("ui_down");
	var up = Input.is_action_just_pressed("ui_up");
	var motion = Vector2(0,0);
	
	if right:
		if rightObject != null:
			print(rightObject)
			if !rightObject.canEnter($Face.getFace()):
				return
				
		motion.x = STEP_SIZE;
	elif left:
		if leftObject != null:
			if !leftObject.canEnter($Face.getFace()):
				return
		motion.x = -STEP_SIZE;
	elif down:
		if downObject != null:
			if !downObject.canEnter($Face.getFace()):
				return
		motion.y = STEP_SIZE;
	elif up:
		if upObject != null:
			if !upObject.canEnter($Face.getFace()):
				return
		motion.y = -STEP_SIZE;

	
	print("Moving")
	# check surroundings
	
	
	var newPos = get_global_position() + motion;
	
	newPos.y = min(max(newPos.y, 50), max_border_y)
	newPos.x = min(max(newPos.x, 50), max_border_x)
	
	if newPos != lastPos:
		lastPos = global_position;
		faceState = $Face.handleInput(up, down, left, right);
	
		$Sprite.modulate = $Face.getColorForInt(faceState)
		
		set_global_position(newPos);
	else:
		print("old: ", lastPos, " new: ", newPos)
		print("did not move")

var max_border_y: int;
var max_border_x: int;

const min_border_x = STEP_SIZE / 2;
var min_border_y;

func _ready():
	max_border_y = 550;
	max_border_x = 950;

func _on_Node2D_area_entered(area):
	print("toched spike");


func _on_Wall1_area_entered(area):
	set_global_position(lastPos);

var rightObject
var leftObject
var upObject
var downObject

func _on_TriggerRight_area_entered(area):
	rightObject = area
	print("right Enter")
	pass # Replace with function body.

func _on_TriggerUp_area_entered(area):
	upObject = area
	print("up Enter")
	pass # Replace with function body.


func _on_TriggerDown_area_entered(area):
	downObject = area
	print("down Enter")
	pass # Replace with function body.


func _on_TriggerLeft_area_entered(area):
	leftObject = area
	print("left Enter")
	pass # Replace with function body.


func _on_TriggerUp_area_exited(area):
	upObject = null
	print("up exit")
	pass # Replace with function body.


func _on_TriggerDown_area_exited(area):
	downObject = null
	print("down exit")
	pass # Replace with function body.


func _on_TriggerRight_area_exited(area):
	rightObject = null
	print("right exit")
	pass # Replace with function body.


func _on_TriggerLeft_area_exited(area):
	leftObject = null
	print("left exit")
	pass # Replace with function body.
