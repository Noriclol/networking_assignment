extends Node



@rpc("any_peer", "call_local", "reliable")
func client_message(message: String):
	var sender_id = multiplayer.get_remote_sender_id()
	print("Received message from client " + str(sender_id) + ": " + message)
