extends KinematicBody2D


func _ready():
	$AnimatedSprite.play("Andando")

var velocidade = 100
var mov = Vector2(velocidade,0)
var direcao = 1

func _process(delta):
	mov.x = direcao*velocidade
	if (direcao== 1):
		$AnimatedSprite.flip_h = false
	else: 
		$AnimatedSprite.flip_h = true
	move_and_slide(mov)
	

func _on_Area2D_body_entered(body):
	if ($AnimatedSprite.animation=="Andando"):
		body.impacto()
		$CollisionShape2D.queue_free()
		$Area2D.queue_free()
		
	velocidade = 0
	$AnimatedSprite.play("Morrendo")
	
	
func _on_p_direito_body_exited(body):
	direcao = -1
	$AnimatedSprite.flip_h = true

func _on_p_esquerdo_body_exited(body):
	direcao = 1
	$AnimatedSprite.flip_h = false

func _on_AnimatedSprite_animation_finished():
	if($AnimatedSprite.animation=="Morrendo"):
		queue_free()
#		$CollisionShape2D.queue_free()

func _on_ataque_body_entered(body):
	if (body.name=="Female"):
		ScriptGlobal.qtd_vidas -= 1
		direcao = direcao * (-1)

func _on_direito_body_entered(body):
	if body.is_in_group("Corpo"):
		direcao = -1
		$AnimatedSprite.flip_h = true

func _on_esquerdo_body_entered(body):
	if body.is_in_group("Corpo"):
		direcao = 1
		$AnimatedSprite.flip_h = false
