# Server Script
extends Node


var network = ENetMultiplayerPeer.new()
var port = 3234
var max_players = 4

@export var players = {}

func _ready() -> void:
	start_server()

func start_server() -> void:
	network.create_server(port, max_players)
	multiplayer.multiplayer_peer = network
	multiplayer.peer_connected.connect(_client_connected)
	multiplayer.peer_disconnected.connect(_client_disconnected)

	print("Server Started")

func _client_connected(id): 
	print("Player: " + str(id) + " Connected")

func _client_disconnected(id): 
	print("Player: " + str(id) + " Disonnected")


@rpc("any_peer", "call_local", "reliable")
func send_message_to_server(message: String):
	var sender_id = multiplayer.get_remote_sender_id()
	print("Received message from client " + str(sender_id) + ": " + message)
