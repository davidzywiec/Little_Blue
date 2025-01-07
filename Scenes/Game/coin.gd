extends AnimatedSprite2D

const FALL_SPEED_MAX : float = 75
const FALL_SPEED_MIN : float = 25

@onready
var coin_area : Area2D = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coin_area.body_entered.connect(collect_coin)
	SignalManager.game_over.connect(game_over)


func _physics_process(delta):
	position.y += randf_range(FALL_SPEED_MIN,FALL_SPEED_MAX) * delta
	
	#Remove coin from scene if not collected and lose a life
	if position.y > get_viewport_rect().size.y:
		SignalManager.update_lives.emit()
		queue_free()


func collect_coin(body : Node2D):
	if body.name == "Player":
		SignalManager.coin_collected.emit()
		queue_free()

## Stop phsyics process when game over
func game_over()-> void:
	set_physics_process(false)

