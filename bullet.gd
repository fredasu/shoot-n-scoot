extends Area2D

var speed = 400
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.x * speed * delta


func _on_area_entered(area):
	area.queue_free()	#deletes enemy
	self.queue_free()	#deletes bullet
