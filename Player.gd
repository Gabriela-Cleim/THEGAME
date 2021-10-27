extends KinematicBody2D

var mov = Vector2(0,0)
const UP = Vector2(0,-1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -550
var motion = Vector2(0,0)
var direcao = 1
var pulo

func impacto():
	motion.y = JUMP_HEIGHT
	
	
func atualizar_hud():
	get_parent().get_node("ParallaxBackground2/vida1").visible = false
	get_parent().get_node("ParallaxBackground2/vida2").visible = false
	get_parent().get_node("ParallaxBackground2/vida3").visible = false

	if (ScriptGlobal.qtd_vidas==3):
		get_parent().get_node("ParallaxBackground2/vida1").visible = true
		get_parent().get_node("ParallaxBackground2/vida2").visible = true
		get_parent().get_node("ParallaxBackground2/vida3").visible = true

	elif (ScriptGlobal.qtd_vidas==2):
		get_parent().get_node("ParallaxBackground2/vida1").visible = true
		get_parent().get_node("ParallaxBackground2/vida3").visible = true

	elif (ScriptGlobal.qtd_vidas==1):
		get_parent().get_node("ParallaxBackground2/vida1").visible = true
		
	else:
		get_tree().change_scene("res://Game Over.tscn")
		
func _physics_process(_delta):
	
	atualizar_hud()
	
	motion.y += GRAVITY
	if (global_position.y>$Camera2D.limit_bottom):
		ScriptGlobal.qtd_vidas -= 1
		get_tree().reload_current_scene()
		var checkpoint = ScriptGlobal.check_point_atual
		global_position = get_parent().get_node(checkpoint).global_position
		
	if Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = true
		$Sprite2.flip_h = true
		if is_on_floor():
			$Sprite.play("Correndo")
			$Sprite2.play("Correndo")
			
#		if direcao==1:
#			scale.x =-0.471
#			direcao=-1
		motion.x = -SPEED
			
	elif Input.is_action_pressed("ui_right"):
		$Sprite.flip_h = false 
		$Sprite2.flip_h = false 
		if is_on_floor():
			$Sprite.play("Correndo")
			$Sprite2.play("Correndo")
			
#		if direcao==-1:
#			scale.x =0.471
#			direcao=1
		motion.x = SPEED
	else: 
		motion.x = 0
		$Sprite.play("Parado")
		$Sprite2.play("Parado")
		
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			motion.y = JUMP_HEIGHT
	
	motion = move_and_slide(motion, UP)
	
func _on_checkpoint2_body_entered(body):
	ScriptGlobal.check_point_atual = "checkpoint2"
	print(ScriptGlobal.check_point_atual)

