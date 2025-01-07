extends Control

@onready
var score : Label = $MarginContainer/HBoxContainer/ScoreValueLabel

@onready
var lives : Label = $MarginContainer/HBoxContainer2/LivesValueLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.update_score.connect(update_score_lives)
	lives.text = str(GameManager.LIVES)

func update_score_lives() -> void:
	score.text = str(ScoreManager.get_score())
	lives.text = str(ScoreManager.get_lives())