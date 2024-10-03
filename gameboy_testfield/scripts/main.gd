extends Node2D

@onready var tilemap = $World/TileMapLayer
var x_range = Vector2(4, 15)
var y_range = Vector2(0, 200)
var platform_interval = 3
var mapgenerator = MapGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mapgenerator.generate_platforms(tilemap,x_range,y_range,platform_interval,Vector2(3,10))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
