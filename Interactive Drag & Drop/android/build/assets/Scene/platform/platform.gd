extends StaticBody2D


func _ready():
	modulate  = Color(Color.STEEL_BLUE, 0.7)


func _process(delta):
	if Global.is_touching:
		visible = true
	else :
		visible = false
