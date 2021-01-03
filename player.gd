extends Area2D
var screensize
var speed = 300; var pos; var extent = 0

var right; var left; var x
func _ready():
	screensize = get_viewport().size
	set_position(Vector2(screensize[0]/2,screensize[1]))
	set_process(true)
func _process(delta):
	right = 0; left = 0
	if Input.is_action_pressed("ui_right")==true:
		right = 1
	if Input.is_action_pressed("ui_left")==true:
		left = 1
	x = (right - left)*speed*delta
	pos = clamp(position[0]+x,extent, screensize[0]-extent)
	set_position(Vector2(pos,position[1]))
	
