extends RigidBody2D

var power = 500
var angle : float = 0
var fired = false
var line_color = Color.white

func _process(delta):
	if fired:
		return
		
	if Input.is_action_pressed("aim_up"):
		angle -= PI/64
	if Input.is_action_pressed("aim_down"):
		angle += PI/64
		
	angle = clamp(angle, - PI/2, 0)
	
	update()
	
	if Input.is_action_pressed("more_power"):
		power +=10
	if Input.is_action_pressed("less_power"):
		power -=10
	
	power = clamp(power, 500, 1000)
	
	if power == 1000:
		line_color = Color.red
	else:
		line_color = Color.white
		
	if Input.is_action_just_pressed("space"):
		var direction = Vector2(1,0).rotated(angle)
		var velocity = direction * power
		apply_impulse(Vector2.ZERO, velocity)
		$AudioStreamPlayer2D.play()
		fired = true

func _draw():
	if not fired:
		 draw_line(Vector2.ZERO, Vector2(power/5, 0).rotated(angle), line_color, 5)
