extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print("Spawned!")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.y < -50:
		queue_free()
	else:
		position.y -= 3
		
	pass
