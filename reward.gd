extends Area2D
var obstacle_speed; signal reward_grabbed; var extents
var screensize; var y
func _ready():
	screensize = get_viewport().size
	extents = get_node("sprite").texture.get_size()/2
	set_position(Vector2(screensize[0]/2,0))
	obstacle_speed = 100
	set_process(true)
func _process(delta):
	if position[1]>= screensize[1] + extents[1]:
		queue_free()
	y = obstacle_speed*delta
	set_position(Vector2(position[0],position[1]+y))
func _on_reward_area_entered(area):
	if area.get_name() == 'player':
		emit_signal("reward_grabbed")
		queue_free()
	if 'obstacle' in area.get_name():
		queue_free()
	print(area.get_name())
