extends Node

var local_score : int = 0

func _ready() -> void:
    SignalManager.coin_collected.connect(add_score)


func add_score():
    local_score += 1
    SignalManager.update_score.emit()


func get_score() -> int:
    return local_score
