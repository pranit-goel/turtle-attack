extends Node
var obstacle = preload("res://obstacle.tscn")
var r_1; var count_1 = 0; var score = 0; var reward_time
var reward = preload("res://reward.tscn")
var count_2 = 0
func _ready():
	
	r_1 = randi()%90 + 60
	reward_time = randi()%240 +240
	set_process(true)
func _process(delta):
	randomize()
	if count_1 == r_1:
		var o = obstacle.instance()
		$obstacle_holder.add_child(o)
		o.set_name('obstacle_'+str($obstacle_holder.get_child_count()))
		o.set_position(Vector2(randi()%(int($player.screensize[0] - 2*$player.extent)) + $player.extent,-o.extents[1]))
		r_1 = randi()%90 + 60
		count_1 = 0
	if count_2 == reward_time:
		var w = reward.instance()
		$reward_holder.add_child(w)
		w.set_name('reward_'+str($reward_holder.get_child_count()))
		w.set_position(Vector2(randi()%(int($player.screensize[0] - 2*$player.extent)) + $player.extent,0))
		w.connect("reward_grabbed",self,"_on_reward_grabbed")
		reward_time = randi()%240 + 240
		count_2 = 0
	count_1 += 1
	count_2 += 1
func _on_reward_grabbed():
	score+=1
	$score.set_text(str(score))
