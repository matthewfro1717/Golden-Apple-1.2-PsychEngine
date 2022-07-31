function onCreate()
	makeLuaSprite('secret_room', 'secret/secret_room', -1800, -1000);
	scaleObject('secret_room', 1.75, 1.75);
	addLuaSprite('secret_room', false);
	
	makeLuaSprite('desk', 'secret/desk', -450, 50);
	scaleObject('desk', 1.45, 1.45);
	addLuaSprite('desk', true);
end