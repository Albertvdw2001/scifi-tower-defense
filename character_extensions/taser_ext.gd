extends Node2D

var projectile

func _physics_process(delta: float) -> void:
	apply_look_point_direction()


func apply_look_point_direction():
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
