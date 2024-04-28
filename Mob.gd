extends RigidBody2D
@export var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()	#get a list
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])	#randi() % n => random integer between 0 and n-1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#var direction = (player.global_position() - position).normalized()
	#var velocity = direction * speed
	#position += velocity * delta
	pass

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()	#mob deletes self when move offscreen
