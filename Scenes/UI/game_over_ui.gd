extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.game_over.connect(game_over)


func _process(delta):
	if Input.is_action_just_pressed("boost") && visible:
		play_again()
	
	if Input.is_action_just_pressed("ui_cancel") && visible:
		back_to_main_menu()


func game_over() -> void:
	visible = true

func play_again() -> void:
	SignalManager.new_game.emit()
	get_tree().reload_current_scene()

func back_to_main_menu() -> void:
	SignalManager.new_game.emit()
	SceneManager.change_scene(2)
