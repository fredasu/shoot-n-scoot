extends Sprite2D

var speed = 150

func _physics_process(delta):
	look_at(get_global_mouse_position())	#rotation to follow mouse
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("click"):
		velocity = get_global_mouse_position() - position	#vector between where mouse and player is
	
	if velocity.length() > 0:
		velocity = -velocity.normalized()	#go opposite direction as where mouse vector is
	position += velocity * speed * delta
