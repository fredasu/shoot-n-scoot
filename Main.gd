extends Node2D

@onready var bullet = preload("res://bullet.tscn")
@onready var enemy = preload("res://enemy.tscn")

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
	if event.is_action_released("spawnEnemy"):	#press space bar to make enemy for debugging
		var enem1 = enemy.instantiate()
		enem1.start(global_transform, $player)
		add_child(enem1)
