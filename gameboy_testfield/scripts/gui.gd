extends Control
#@onready var pathfollow = $"../Path2D/PathFollow2D"
@onready var player = $"../World/Player"
@onready var beep = $"../Audios/Beep"
@onready var score_label = $Score
@onready var hi_score_label = $"Hi-Score"
var buttons = []
var current_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	buttons = [
		$StartScreen1/StartButton,
		$StartScreen1/StartButton2
	]
	update_score()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#position = pathfollow.position - Vector2(160,144)
	#$SpeedProgressBar.value = player.acc.length()
	if Global.GAME_STARTED == true:
		Global.SCORE += 1
		update_score()
		return

	if Input.is_action_just_pressed("ui_up"):
		current_index = (current_index - 1 + buttons.size()) % buttons.size()
		_update_hover()
		beep.play()
	elif Input.is_action_just_pressed("ui_down"):
		current_index = (current_index + 1) % buttons.size()
		_update_hover()
		beep.play()
	if Input.is_action_just_pressed("ui_accept"):
		buttons[current_index].emit_signal("pressed")
		beep.play()
	if Input.is_action_just_pressed("select"):
		if Global.ON_CREDITS == true:
			Global.ON_CREDITS = false
			$"../Camera/Camera2D".position = Vector2(160,-144)
			beep.play()
	pass
	
func _update_hover():
	for i in range(buttons.size()):
		if i == current_index:
			buttons[i].grab_focus() # 模拟 hover 效果
			print("button"+ str(current_index) + "is now on focus")
		else:
			buttons[i].release_focus() # 取消 hover

func _on_start_button_pressed() -> void:
	if Global.ON_CREDITS == true:
		return
	$"../Audios/StartSound".play()
	Global.GAME_STARTED = true
	#print("start_btn")
	await get_tree().create_timer(3).timeout
	$"../Audios/BGM".play()
	$"../Camera/Camera2D".position = Vector2(160,144)
	await get_tree().create_timer(3).timeout
	$GetReady.queue_free()
	$"../World/StaticBody2D".queue_free()
	pass # Replace with function body.

func _on_start_button_2_pressed() -> void:
	if Global.ON_CREDITS == false:
		$"../Camera/Camera2D".position = Vector2(480.0,-144.0)
		Global.ON_CREDITS = true
		#print("credits_btn")
	pass # Replace with function body.

func screen_switch(begin_pos,end_pos):
	for i in range(1,10):
		get_node("../Camera/Camera2D/CanvasGroup/CanvasLayer/DitherShader").material.set_shader_parameter("quantize_size",i)
		await get_tree().create_timer(0.05).timeout 
	#get_node("../Camera/Camera2D/CanvasGroup/CanvasLayer/DitherShader").material.set_shader_parameter("palette","")
	# Switch here
	
	for i in range(10,1,-1):
		get_node("../Camera/Camera2D/CanvasGroup/CanvasLayer/DitherShader").material.set_shader_parameter("quantize_size",i)
		await get_tree().create_timer(0.05).timeout 
		self.create_tween().tween_property(self,"position",Vector3.ZERO,10)

func update_score():
	var hi_zero = 6 - str(Global.HI_SCORE).length()
	hi_score_label.text = "HI    " + str(0).repeat(hi_zero) + str(Global.HI_SCORE)
	$"StartScreen1/Hi-Score".text = "HI    " + str(0).repeat(hi_zero) + str(Global.HI_SCORE)
	var score_zero = 6 - str(Global.SCORE).length()
	score_label.text = "SCORE " + str(0).repeat(score_zero) + str(Global.SCORE)
	if Global.SCORE >= Global.HI_SCORE:
		Global.HI_SCORE = Global.SCORE
	pass
