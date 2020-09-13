extends Node2D

var ball_scene = preload("CannonBall.tscn")
var ball_scene2 = preload("CannonBall2.tscn")
var Gcounter: int = 3
var Bcounter: int = 1
var loaded: bool = false

func _process(delta):
	if loaded == false:
		if Input.is_action_just_pressed("Add Green"):
			reload_Gball()
		
		if Input.is_action_just_pressed("Add Brown"):
			reload_Bball()
			
	if Input.is_action_just_pressed("space"):
		loaded = false
	
	if Gcounter == 0 and Bcounter == 0:
		queue_free()
		
func reload_Gball():
	if Gcounter > 0:
		loaded = true
		var ball = ball_scene.instance()
		get_parent().add_child(ball)
		ball.position = get_global_position()
		Gcounter -= 1
	
func reload_Bball():
	if Bcounter >0:
		loaded = true
		var ball2 = ball_scene2.instance()
		get_parent().add_child(ball2)
		ball2.position = get_global_position()
		Bcounter -= 1
	
