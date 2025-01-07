extends Node

var local_score : int = 0
var local_lives : int = GameManager.LIVES

func _ready() -> void:
	SignalManager.coin_collected.connect(add_score)
	SignalManager.update_lives.connect(lose_life)
	SignalManager.new_game.connect(new_game)


func add_score():
	local_score += 1
	SignalManager.update_score.emit()


func lose_life():
	local_lives -= 1
	SignalManager.update_score.emit()
	if local_lives == 0:
		SignalManager.game_over.emit()

func get_score() -> int:
	return local_score


func get_lives() -> int:
	return local_lives


func new_game()-> void:
	local_score = 0
	local_lives = GameManager.LIVES