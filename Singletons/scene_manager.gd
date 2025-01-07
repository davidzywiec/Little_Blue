extends Node

const GAME_SCENE : PackedScene = preload("res://Scenes/Game/game.tscn")

const MENU_SCENE : PackedScene = preload("res://Scenes/Main Menu/Main_Menu.tscn")

## Change scenes based on int. 1 is GAME_SCENE. 2 is MENU_SCENE
func change_scene(scene : int)->void:
    if scene == 1:
        get_tree().change_scene_to_packed(GAME_SCENE)
    elif scene == 2:
        get_tree().change_scene_to_packed(MENU_SCENE)
    