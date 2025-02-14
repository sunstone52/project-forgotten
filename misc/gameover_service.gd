class_name GameOverService
extends Node


signal won

export var final_event_name: String

onready var _final_event := EventRepository.get_event(final_event_name)


func _win() -> void:
	get_tree().change_scene("res://scenes/game_end/game_end.tscn")
	emit_signal("won")


func _on_EventBoard_event_ended(event: Event, complete: bool) -> void:
	if not _final_event:
		return
	
	if event == _final_event and complete:
		_win()
