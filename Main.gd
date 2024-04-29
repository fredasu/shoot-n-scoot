extends Node2D

@onready var bullet = preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("icon").look_at(get_global_mouse_position())

func _input(event):
	if event.is_action_released("click"):
		var bullet1 = bullet.instantiate()
		bullet1.position = get_node("icon").position
		bullet1.rotation = get_node("icon").rotation
		add_child(bullet1)
