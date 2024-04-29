extends Node2D

@onready var bullet = preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_released("click"):
		var bullet1 = bullet.instantiate()
		bullet1.transform = $player/Marker2D.global_transform
		add_child(bullet1)
