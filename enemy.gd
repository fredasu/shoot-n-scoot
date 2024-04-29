extends CharacterBody2D

var speed = 150
var screen_size # Size of the game window
var buffer = 70	#adjust as needed to not get stuck on the edge of the board/wraparound (full sprite visible again)
@onready var target = $"../player"

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	velocity = position.direction_to(target.position) * speed
	move_and_collide(velocity)
