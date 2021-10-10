extends Node2D

export (String) var color
var is_matched
var is_counted
var selected = false
var target_position = Vector2(0,0)
var default_modulate = Color(1,1,1,1)
var highlight = Color(1,0.8,0,1)

var dying = false
var fall_speed = 1.0

func _ready():
	$Select.texture = $Sprite.texture
	$Select.scale = $Sprite.scale
	randomize()

func _physics_process(_delta):
	if dying and not $Tween.is_active():
		queue_free()
	if selected:
		$Select.show()
		$Selected.emitting = true
		z_index = 10
	else:
		$Select.hide()
		$Selected.emitting = false
		z_index = 1

func move_piece(change):
	target_position = position + change
	position = target_position
	


func die():
	dying = true
	var target_color = $Sprite.modulate
	target_color.s = 1
	target_color.a = 0.25
	target_color.h = randf()
	var fall_duration = randf()*fall_speed + 1
	var rotate_amount = (randi() % 1440) - 720
	
	var target_pos = position
	target_pos.y = 1100
	$Tween.interpolate_property(self, "position", position, target_pos, Tween.TRANS_CUBIC, Tween.EASE_IN)
	$Tween.start()
	$Tween.interpolate_property($Sprite, "modulate" , $Sprite.modulate, target_color, fall_duration-0.25, Tween.TRANS_EXPO, Tween.EASE_IN)
	$Tween.start()
	$Tween.interpolate_property(self, "rotation_degrees", rotation_degrees, rotate_amount, fall_duration-0.25, Tween.TRANS_QUINT, Tween.EASE_IN)
	$Tween.start()
