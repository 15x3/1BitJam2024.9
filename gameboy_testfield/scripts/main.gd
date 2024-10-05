extends Node2D

@onready var tilemap = $World/TileMapLayer
@onready var pathfollow = $PlatformSpawn/PathFollow2D
@export var platform : PackedScene
var x_range = Vector2(4, 15)
var y_range = Vector2(0, 200)
var platform_interval = 3
var mapgenerator = MapGenerator.new()
var level_total_time = 30.0
var progress_time = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#mapgenerator.generate_platforms(tilemap,x_range,y_range,platform_interval,Vector2(3,10))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#progress_time += delta
	#if progress_time >= level_total_time:
		#pathfollow.progress_ratio = 1.0
	#else:
		#pathfollow.progress_ratio = progress_time / level_total_time
	##pathfollow.progress_ratio = 
	pass
	


func _on_mob_timer_timeout() -> void:
	#mapgenerator.gengrate_platforms_v2(platform,pathfollow)
	var platform_length = randi_range(1,3)
	if not platform:
		print("Mob scene is invalid!")
		return
	# Create a new instance of the Mob scene.
	var mob = platform.instantiate()
	# Choose a random location on Path2D.
	pathfollow.progress_ratio = randf_range(0.25,0.75)
	mob.position = pathfollow.position
	mob.draw_platform(platform_length,Vector2(18,17))
	#print("Mob position:", pathfollow.position)
	#mob.linear_velocity = Vector2(1.0, 0.0)
	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
	pass # Replace with function body.
