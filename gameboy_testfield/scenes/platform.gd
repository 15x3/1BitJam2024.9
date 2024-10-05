extends CharacterBody2D

#@onready var tilemap = $TileMapLayer
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

func draw_platform(platform_length: int,target_vector2: Vector2) -> void:
	var tilemap = $TileMapLayer
	for i in platform_length:
		tilemap.set_cell(Vector2(i,0),0,target_vector2,0)
		tilemap.set_cell(Vector2(-1,0),0,target_vector2,0)
	pass
