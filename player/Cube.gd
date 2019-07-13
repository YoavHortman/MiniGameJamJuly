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
		motion.x = STEP_SIZE;
	elif left:
		motion.x = -STEP_SIZE;
	elif down:
		motion.y = STEP_SIZE;
	elif up:
		motion.y = -STEP_SIZE;
	
	var newPos = get_global_position() + motion;
	
	if newPos.y >= max_border_y || newPos.y <= min_border_y:
		motion.y = 0;
		newPos.y = min(newPos.y, max_border_y);
		newPos.y = max(min_border_y, newPos.y);
	if newPos.x >= max_border_x || newPos.x < min_border_x:
		motion.x = 0;
		newPos.x = min(newPos.x, max_border_x);
		newPos.x = max(min_border_x, newPos.x);
	
	print("new", newPos);
	print("last", lastPos);
	if round(newPos.x) != round(lastPos.x) or round(newPos.y) != round(lastPos.y):	
		lastPos = global_position;
		faceState = $Face.handleInput(up, down, left, right);
	
		$Sprite.modulate = $Face.getColorForInt(faceState)
		
		set_global_position(newPos);

var max_border_y: int;
var max_border_x: int;

const min_border_x = STEP_SIZE / 2;
var min_border_y;

func _ready():
	max_border_y = get_viewport_rect().size.y - (STEP_SIZE / 2);
	min_border_y = STEP_SIZE / 2;
	max_border_x = get_viewport_rect().size.x - (STEP_SIZE / 2);

func _on_Node2D_area_entered(area):
	print("toched spike");


func _on_Wall1_area_entered(area):
	set_global_position(lastPos);
