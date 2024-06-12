extends Node2D

var dropabble = false
var sedang_didalam_platform = false
var body_ref
var offset : Vector2
var posisi_saat_ini : Vector2

func ready():
	pass

func _physics_process(delta):
	if dropabble:
		if Input.is_action_just_pressed("click"):
			offset = get_global_mouse_position() - global_position
			Global.is_touching = true
			posisi_saat_ini = global_position
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			Global.is_touching = false
			var tween = get_tree().create_tween()
			if sedang_didalam_platform:
				tween.tween_property(self,"global_position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
			else :
				tween.tween_property(self,"global_position", posisi_saat_ini, 0.2).set_ease(Tween.EASE_OUT)
		

func _on_area_2d_body_entered(body):
	if body.is_in_group("dropable"):
		sedang_didalam_platform = true
		body.modulate = Color(Color.CADET_BLUE, 1)
		body_ref = body

func _on_area_2d_body_exited(body):
	if body.is_in_group("dropable"):
		sedang_didalam_platform = false
		body.modulate = Color(Color.STEEL_BLUE, 1)

func _on_area_2d_mouse_entered():
	if !Global.is_touching:
		dropabble = true
		scale = Vector2(1.05,1.05)

func _on_area_2d_mouse_exited():
	if !Global.is_touching:
		dropabble = false
		scale = Vector2(1,1)
