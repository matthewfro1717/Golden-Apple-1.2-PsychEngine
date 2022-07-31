function onCreate()
	makeLuaSprite('bg', 'bg', -600, -300);
	scaleObject('bg', 1.75, 1.75);
	addLuaSprite('bg', false);
	
	makeLuaSprite('meet', 'meet', -255, -50);
	scaleObject('meet', 1.25, 1.25); -- because why not? lol --
	addLuaSprite('meet', true);
end