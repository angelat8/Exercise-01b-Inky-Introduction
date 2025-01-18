/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Basic Choices
 - Knot structure
 - Recurring choices
 - Conditionals in descriptions
 - Conditionals in choices
 
 In the assignment:
 - Add four more knots (and feel free to change any of the example text, this is YOUR story)
 - Add at least one more conditional
*/

-> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.
+ [Take the east tunnel.] { - east_tunnel_lit || west_room_lit: 
			-> east_tunnel_lit
		- else:
			-> east_tunnel
	}
+ [Take the west tunnel.] -> west_tunnel
* [Pick up the torch] -> torch_pickup


== east_tunnel ==
You are in the east. It is very dark, you can't see anything.

* {torch_pickup} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west. {not (east_tunnel_lit || west_room_lit): As you walk, you bump into what feel like a door. | You see a door.}
+ [Open Door] -> open_door
+ [Go Back] -> cave_mouth
-> END

== torch_pickup == //enterance
You now have a torch. May it light the way.
+ [Go Back] -> cave_mouth
-> END

== east_tunnel_lit == //east, torch lit
The light of your torch glints off of the gold chest in the room.
* {key_pickup} [Use the key to open the chest.] -> key_chest
+ [Try to pry the chest open] -> pry_chest
+ [Go Back] -> cave_mouth
-> END

== key_chest == //east, torch lit, chest
You use the key to open the chest. Inside the chest are hundrends of gold coins. You are now rich.
+ [Go Back] -> cave_mouth
-> END


== pry_chest == //east, torch lit, chest
You try to pry the chest open. It does not budge.
+ [Go Back] -> cave_mouth
-> END

== open_door == //west tunnel
The door is now opened.
* { torch_pickup && not (east_tunnel_lit || west_room_lit)} [Light the Torch first.] -> west_room_lit
+ [Go inside.] { - east_tunnel_lit || west_room_lit:
			-> west_room_lit
		- else:
			-> west_room
	}
+ [Go Back] -> cave_mouth
-> END

== west_room == //west, open door
You step inside the dark room. You don't notice the giant pit in the floor and fall down the hole. You have died.
-> END

== west_room_lit == //west, light torch, open door
Your torch is lit and notice there is a giant pit right past the door. {not key_pickup:You walk around the pit and see a silver key on the floor.}
* [Pick up the key] -> key_pickup
+ [Go Back] -> cave_mouth
-> END

== key_pickup == //west, light torch, open door, pickup key
You now have a key. You are not sure what it is for but you put it in your pocket.
+ [Go Back] -> cave_mouth
-> END





