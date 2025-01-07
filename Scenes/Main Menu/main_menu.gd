extends Control

@onready
var start_btn : Button = $Panel/VBoxContainer/Start
@onready
var quit_btn : Button = $Panel/VBoxContainer/Quit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_btn.pressed.connect(start_game)
	quit_btn.pressed.connect(quit_game)

func start_game()->void:
	SceneManager.change_scene(1)

func quit_game()->void:
	get_tree().quit()
