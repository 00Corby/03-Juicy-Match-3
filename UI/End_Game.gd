extends Control



func _ready():
	$Label.text = "Thanks for Playing!\n\nScore for Level 1:  "+ str(Global.level1_score) + "\n\nTime for Level 2:  " + str(Global.level2_time)




func _on_Quit_pressed():
	get_tree().quit()


func _on_Play_pressed():
	Global.score = 0
	Global.time = Global.level1_default
	Global.level = 1 
	Global.level1_score = 0
	Global.level2_time = 0
	get_tree().change_scene("res://Game.tscn")
