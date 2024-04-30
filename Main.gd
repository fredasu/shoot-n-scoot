extends Node

@onready var bullet = preload("res://bullet.tscn")
@export var mob_scene: PackedScene

var score
var wait = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func new_game():
	score = 0
	get_tree().call_group("mobs", "queue_free")
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$player.start()
	$Music.play()
	wait = false	#so dont kill yourself with a bullet right off the bat

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if wait and event.is_action_released("click"):
		var bullet1 = bullet.instantiate()
		bullet1.transform = $player/Marker2D.global_transform
		add_child(bullet1)


func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position
	mob.start($player)
	
	add_child(mob)


func game_over(area):	#can friendly fire on self and lose
	$player.hide()
	$MobTimer.stop()
	$ScoreTimer.stop()
	$HUD.show_game_over()
	$player/CollisionShape2D.set_deferred("disabled", true)	#disable to not repeat signal
	$Music.stop()
	$DeathSound.play()
	wait = false


func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	$HUD.update_score(score)
	wait = true
