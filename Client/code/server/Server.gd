# Client Script
extends Node

const DEFAULT_IP = "127.0.0.1"
const DEFAULT_PORT = 3234

var network = ENetMultiplayerPeer.new()
var selected_IP
var selected_port

var local_player_id = 0

var player_data = {}

func _ready() -> void:
	multiplayer.peer_connected.connect(_client_connected)
	multiplayer.peer_disconnected.connect(_client_disconnected)
	multiplayer.connected_to_server.connect(_connect_ok)
	multiplayer.connection_failed.connect(_connect_fail)
	multiplayer.server_disconnected.connect(_server_disconnected)


func _connect_to_server():
	network.create_client(DEFAULT_IP, DEFAULT_PORT)
	multiplayer.multiplayer_peer = network
	


func _client_connected(id):
	print("Player: " + str(id) + " Connected")
	register_player()


func _client_disconnected(id):
	print("Player: " + str(id) + " Disconnected")


func _connect_ok():
	print("Successfully connected to server")


func _connect_fail():
	print("Failed to connect to server")

func _server_disconnected():
	print("Server Disconnected")
	


func register_player():
	local_player_id = multiplayer.get_unique_id()
	player_data = Save.save_data
	#transmit_message.rpc_id(1, "Hello_World")
	
