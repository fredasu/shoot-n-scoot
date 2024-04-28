extends Area2D

@export var speed = 400 # How fast the player will move (pixels/sec). export = can be set in inspector
var screen_size # Size of the game window.
var buffer = 40	#adjust as needed to not get stuck on the edge of the board/wraparound (full sprite visible again)
signal hit
signal shoot(bullet, direction, location)

var bullet = preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()	#hide player when game starts

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	look_at(get_global_mouse_position())	#rotation to follow mouse
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("click"):
		velocity = get_global_mouse_position() - position	#vector between where mouse and player is
		shoot.emit(bullet, position, velocity)
	if velocity.length() > 0:
		velocity = -velocity.normalized() * speed	#go opposite direction as where mouse vector is
		$AnimatedSprite2D.play()	#$ is shorthand for get_node(), use relative path => get_node("AnimatedSprite2D").play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta	#delta = frame length: movement will remain consistent even if the frame rate changes
	#wrap around the board check
	if (position.x < 0):
		position.x = screen_size.x - buffer
	elif (position.x > screen_size.x):
		position.x = buffer
	if (position.y < 0):
		position.y = screen_size.y - buffer
	elif (position.y > screen_size.y):
		position.y = buffer
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0	# boolean assignment
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity.y > 0


func _on_body_entered(body):
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)	#disable to not repeat signal

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
