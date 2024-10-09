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
	for i in 2:
		var bullet = bullet.instantiate()
		bullet.linear_velocity = Vector2(50.0 - 100.0 * i,0.0)
		add_child(bullet)
	pass # Replace with function body.
