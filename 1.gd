extends Button
func _ready():
	pass


func _on_1_button_down():
	print("yay")
	var file = File.new()
	var err = file.open("res://pranit.txt", File.READ_WRITE) #res://pranit.txt
	if err == 7:
		file.open("res://pranit.txt", File.WRITE)
		file.close()
	file.open("res://pranit.txt", File.READ_WRITE)
	var bef = file.get_as_text()
	print(bef)
	file.seek_end()
	file.store_string("1")
	var aft = file.get_as_text()
	print(aft)
	file.close()
