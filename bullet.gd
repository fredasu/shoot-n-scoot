extends Area2D
var direction: Vector2
var speed: int = 100
var velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()	#deletes self when move offscreen

func _physics_process(delta):
	velocity = direction.normalized()  * speed
	position += velocity * delta
