extends Node2D

@onready var movement_speed := 1.0



var z_pressed_time = -1
var x_pressed_time = -1
var input_window_duration = 0.2  # 设定时间窗口为0.2秒

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not Global.MOVEMENT_ENABLE: 
		pass
	else:
		# 调用控制、射击
		handle_controls(delta)
		handle_action()

func handle_controls(delta):
	# Movement
	var inputVelocity := Input.get_vector("left", "right", "down", "up")
	var movement_velocity = inputVelocity.normalized() * movement_speed
	# 三维向量改成二维向量，V3->V2
	# 需要重力，考虑写在handle_control里面，计算完输入产生的向量后再将该向量输入到handle_gravity中，返回最终向量
	var finalVelocity = handle_gravity(movement_velocity)
	
func handle_gravity(movement_velocity):
	pass

func handle_action():
	# 检测 z 键刚刚被按下
	if Input.is_action_just_pressed("z"):
		z_pressed_time = Time.get_ticks_msec()

	# 检测 x 键刚刚被按下
	if Input.is_action_just_pressed("x"):
		x_pressed_time = Time.get_ticks_msec()

	# 判断 z 和 x 是否在时间窗口内几乎同时按下
	if z_pressed_time > 0 and x_pressed_time > 0:
		if abs(z_pressed_time - x_pressed_time) <= int(input_window_duration * 500):
			print("Both 'z' and 'x' pressed within the input window.")
			# 触发你的动作
			# 重置时间
			z_pressed_time = -1
			x_pressed_time = -1
	# 分别处理 z 或 x 键的单独按下
	elif z_pressed_time > 0 and (Time.get_ticks_msec() - z_pressed_time) > int(input_window_duration * 500):
		print("'z' was pressed without 'x'.")
		# 重置 z 的时间
		z_pressed_time = -1
	elif x_pressed_time > 0 and (Time.get_ticks_msec() - x_pressed_time) > int(input_window_duration * 500):
		print("'x' was pressed without 'z'.")
		# 重置 x 的时间
		x_pressed_time = -1
