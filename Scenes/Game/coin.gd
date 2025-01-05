extends AnimatedSprite2D

const FALL_SPEED_MAX : float = 75
const FALL_SPEED_MIN : float = 25

@onready
var coin_area : Area2D = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coin_area.body_entered.connect(collect_coin)


func _physics_process(delta):
	position.y += randf_range(FALL_SPEED_MIN,FALL_SPEED_MAX) * delta


func collect_coin(body : Node2D):
	if body.name == "Player":
		SignalManager.coin_collected.emit()
		queue_free()



