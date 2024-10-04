extends Node2D

class_name MapGenerator
# 获取TileMap节点
#@onready var tilemap = $World/TileMapLayer

# 平台生成的X轴范围
#var x_range = Vector2(3, 16)

# 平台生成的Y轴范围
#var y_range = Vector2(0, 200)

# 平均每3个单位生成一个平台
#var platform_interval = 3

# 平台Tile ID（确保这个ID与TileMap中的平台Tile一致）

# 生成平台
func generate_platforms(tilemap:TileMapLayer,x_range:Vector2,y_range:Vector2,platform_interval:int,platform_length_range:Vector2):
	# 遍历y轴，根据每个platform_interval单位生成平台
	for y in range(y_range.x, y_range.y, platform_interval):
		# 随机选择一个x位置，确保平台在隧道宽度内
		var random_x = randi_range(x_range.x, x_range.y)
		# 随机生成平台的长度
		var platform_length = randi_range(platform_length_range.x, platform_length_range.y)
		# 确保平台不会超出X轴范围
		platform_length = min(platform_length, x_range.y - random_x + 1)
		# 将平台放置在TileMap的指定位置
		for i in range(platform_length):
			tilemap.set_cell(Vector2(random_x+i,y),0,Vector2(18,17),0)


#func gengrate_platforms_v2(pathfollow2D:PathFollow2D,range:Vector2,platform:PackedScene):
	## 我就不设置检测了，反正是给自己用的
	#var platform_set = platform.instantiate()
	#platform_set.set_cell(Vector2(1,0),0,Vector2(18,17),0)
	#pathfollow2D.progress_ratio = randf()
	#pass


func gengrate_platforms_v2(mob_scene:PackedScene,mob_spawn_location:PathFollow2D):
	if not mob_scene:
		print("Mob scene is invalid!")
		return
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()
	# Choose a random location on Path2D.
	mob_spawn_location.progress_ratio = randf()
	mob.position = mob_spawn_location.position
	print("Mob position:", mob_spawn_location.position)
	#mob.linear_velocity = Vector2(1.0, 0.0)
	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
