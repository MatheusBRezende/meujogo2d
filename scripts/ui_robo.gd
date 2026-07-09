extends Control

@onready var label_nome: Label = $PanelContainer/VBoxContainer/LabelNome
@onready var label_trabalho: Label = $PanelContainer/VBoxContainer/LabelTrabalho
@onready var label_energia: Label = $PanelContainer/VBoxContainer/LabelEnergia
@onready var label_tarefa: Label = $PanelContainer/VBoxContainer/LabelTarefa
@onready var label_inventario: Label = $PanelContainer/LabelInventario

func atualizar(robo: Node2D) -> void:
	label_nome.text = "Nome: " + robo.nome_robo
	label_energia.text = "Energia: " + str(robo.energia)
	label_tarefa.text = "Nome: " + robo.tarefa_atual
	
