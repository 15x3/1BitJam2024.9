extends CharacterBody2D

@export var bullet:PackedScene

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if position.y < -50:
		queue_free()
	else:
		position.y -= 1
		
	pass


func _on_timer_timeout() -> void:
	var bullet = bullet.instantiate()
	var direction = randf_range(-PI / 4, PI / 4)
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	bullet.linear_velocity = velocity.rotated(direction)
	add_child(bullet)
	pass # Replace with function body.
