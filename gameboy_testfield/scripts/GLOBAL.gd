extends Node
# 全局设置选项
enum SCREEN_MODE {
	GBA,
	NC1000
}
enum DIFFICULTY {
	EASY,
	NORMAL,
	HARD
}
#enum COLORMODE {
	#NOKIA,
	#STARCOM
#}
var MOVEMENT_ENABLE = true
var COLORMODE = "NOKIA"
var ON_CREDITS = false
var GAME_STARTED = false
var HI_SCORE = 10000
var SCORE = 0
var INVINCIBLE = false
