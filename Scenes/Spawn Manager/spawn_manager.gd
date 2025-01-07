extends Node2D

@onready
var spawn_timer : Timer = $SpawnTimer
@onready
var coins : Node2D = $Coins
var y_range = 50

var coin_scene : PackedScene = preload("res://Scenes/Game/coin.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_timer.timeout.connect(spawn)
	SignalManager.game_over.connect(game_over)

func spawn() -> void:
	var coin = coin_scene.instantiate()
	coins.add_child(coin)
	var y_pos = randf_range(5,y_range)
	var x_pos = randf_range(5,get_viewport_rect().size.x)
	coin.position = Vector2(x_pos,y_pos)

## Stop spawning when game over
func game_over() -> void:
	spawn_timer.stop()