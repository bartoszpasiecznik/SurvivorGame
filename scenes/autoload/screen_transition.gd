extends CanvasLayer

signal transitioned_halfway

var skip_emit = false


func transition():
	$AnimationPlayer.play("default")
	await transitioned_halfway
	skip_emit = true
	$AnimationPlayer.play_backwards("default")


func emit_trasitioned_halfway():
	if skip_emit:
		skip_emit = false
		return
	transitioned_halfway.emit()


func transition_to_scene(scene_path: String):
	ScreenTransition.transition()
	await ScreenTransition.transitioned_halfway
	get_tree().change_scene_to_file(scene_path)
