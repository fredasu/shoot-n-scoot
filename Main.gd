extends Node

@onready var bullet = preload("res://bullet.tscn")
@onready var enemy = preload("res://enemy.tscn")
@export var mob_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$MobTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_released("click"):
		var bullet1 = bullet.instantiate()
		bullet1.transform = $player/Marker2D.global_transform
		add_child(bullet1)


func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position
	mob.start($player)
	
	add_child(mob)


func game_over(area):
	$player.hide()
	print("ahh")
