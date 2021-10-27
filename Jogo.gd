extends Node2D



	
func _ready():
	$Female/Sprite.visible = false
	$Female/Sprite2.visible = false
	
	if (ScriptGlobal.cod_personagem==1):
		$Female/Sprite.visible = true
	elif (ScriptGlobal.cod_personagem==2):
		$Female/Sprite2.visible = true
	
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
		
