extends Area2D

const STEP_SIZE = 100;

func _physics_process(delta):
	var right = Input.is_action_just_pressed("ui_right");
	var left =  Input.is_action_just_pressed("ui_left");
	var down = Input.is_action_just_pressed("ui_down");
	var up = Input.is_action_just_pressed("ui_up");
	var motion = Vector2(0,0);
	
	var newState = $Face.handleInput(up, down, left, right);

	$Sprite.modulate = $Face.getColorForInt(newState)
	
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
	
	set_global_position(newPos);

var max_border_y: int;
var max_border_x: int;

const min_border_x = STEP_SIZE / 2;
var min_border_y;

func _ready():
	max_border_y = get_viewport_rect().size.y - (STEP_SIZE / 2);
	min_border_y = STEP_SIZE / 2;
	max_border_x = get_viewport_rect().size.x - (STEP_SIZE / 2);