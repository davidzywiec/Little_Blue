extends StaticBody2D
## Player Controller.
##
## The player script will be used to move the player up, down, left, and right,

class_name Player

@onready
var boost_timer : Timer = $BoostTimer
var boost_speed : float = 0
var boost_charges : int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	boost_timer.timeout.connect(apply_boost.bind(false))
	SignalManager.game_over.connect(game_over)
	SignalManager.new_game.connect(new_game)

func _process(delta):
	#Check on boost
	if Input.is_action_just_pressed("boost") && boost_charges > 0:
		apply_boost(true)

func _physics_process(delta: float) -> void:
	move_player(delta)

## This method moves the player
## The input values must be assigned for the wasd keys and the arrow keys
## Only moves horizontally
func move_player(delta: float) -> void:

	var new_position = position
	if Input.get_action_raw_strength("move_left"):
		new_position += (Vector2(-1,0) * (GameManager.SPEED + boost_speed) * delta)
	elif Input.get_action_raw_strength("move_right"):
		new_position += (Vector2(1,0) * (GameManager.SPEED + boost_speed) * delta)

	#Check on boundaries
	if new_position.x > 10 && new_position.x < get_viewport_rect().size.x - 10:
		position = new_position

func apply_boost(enable: bool):
	if enable:
		boost_charges =- 1
		boost_timer.start()
		boost_speed = GameManager.BOOST
	else:
		boost_speed = 0

##Stop physics on game over
func game_over()->void:
	set_physics_process(false)

func new_game()->void:
	boost_charges = 1
