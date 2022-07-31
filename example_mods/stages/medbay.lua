function onCreate()
	makeLuaSprite('farBuildings', 'unhinged/farBuildings', -2300, -450);
	setScrollFactor('farBuildings', 0.3, 0.3);
	addLuaSprite('farBuildings', false);
	
	makeLuaSprite('floor', 'unhinged/floor', -2300, -600);
	addLuaSprite('floor', false);
	
	makeLuaSprite('closeBuildings', 'unhinged/closeBuildings', -2300, -750);
	addLuaSprite('closeBuildings', false);
	
	makeAnimatedLuaSprite('unhinged_dumpsta', 'unhinged/unhinged_dumpsta', -600, 250);
	addAnimationByPrefix('unhinged_dumpsta', 'idle', 'Dump instance 1', 24, true);
	objectPlayAnimation('unhinged_dumpsta', 'idle', false, 24);
	addLuaSprite('unhinged_dumpsta', false);
	
	makeLuaSprite('hat', 'unhinged/hat', -750, -500);
	addLuaSprite('hat', false);
end