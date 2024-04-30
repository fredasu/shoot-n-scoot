extends Area2D

var speed = 300
var screen_size # Size of the game window
var buffer = 70	#adjust as needed to not get stuck on the edge of the board/wraparound (full sprite visible again)

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	look_at(get_global_mouse_position())	#rotation to follow mouse
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("click"):
		velocity = get_global_mouse_position() - position	#vector between where mouse and player is
	
	if velocity.length() > 0:
		velocity = -velocity.normalized()	#go opposite direction as where mouse vector is
	position += velocity * speed * delta
	#wrap around the board check
	if (position.x < 0):
		position.x = screen_size.x - buffer
	elif (position.x > screen_size.x):
		position.x = buffer
	if (position.y < 0):
		position.y = screen_size.y - buffer
	elif (position.y > screen_size.y):
		position.y = buffer

func start():
	screen_size = get_viewport_rect().size	#in case screensize changed
	position = Vector2(screen_size.x/2, screen_size.y/2)	#force it to start in the center every time
	show()
	$CollisionShape2D.disabled = false
