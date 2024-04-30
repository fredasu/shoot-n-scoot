extends Area2D

var speed = 400
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.x * speed * delta

func _on_area_entered(area):
	if (area.name == "player"):
		area.hide()	#don't delete player otherwise bullet transform error
	else:
		area.queue_free()	#delete enemy
	self.queue_free()	#delete bullet from collision

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()	#deletes self when move offscreen
