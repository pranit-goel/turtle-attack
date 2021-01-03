extends Label
var time = 0
func _ready():
	set_process(true)
func _process(delta):
	time=delta+time
	set_text(str(stepify(time,0.1)))
