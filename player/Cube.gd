extends Area2D

const STEP_SIZE = 3200;
var motion := Vector2();

func _physicis_process():
	var right = Input.is_action_pressed("ui_right");
	var left =  Input.is_action_pressed("ui_left");
	var down = Input.is_action_pressed("ui_down");
	var up = Input.is_action_pressed("ui_up");
	if right:
		motion.x = STEP_SIZE;
	elif left:
		motion.x = -STEP_SIZE;

	if down:
		motion.y = STEP_SIZE;
	elif up:
		motion.y = -STEP_SIZE;
	
	var newPos = get_global_position() + motion;
	
	print(newPos);
	
	set_global_position(newPos);
	motion = Vector2(0,0);

var max_border_y: int;
var max_border_x: int;

const min_border_x = 32;
var min_border_y;

func _ready():
	max_border_y = get_viewport_rect().size.y - 32;
	min_border_y = (get_viewport_rect().size.y / 1.5) - 32;
	max_border_x = get_viewport_rect().size.x - 32;