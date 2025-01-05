extends Control

@onready
var score : Label = $HBoxContainer/ScoreValueLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.update_score.connect(update_score)


func update_score() -> void:
	score.text = str(ScoreManager.get_score())