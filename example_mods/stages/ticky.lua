function onCreate()
	makeLuaSprite('gunkk', 'ticking/gunkk', 600, 200);
	addLuaSprite('gunkk', false);

	makeAnimatedLuaSprite('ticking_tunnel', 'ticking/ticking_tunnel', 0, -150);
	addAnimationByPrefix('ticking_tunnel', 'idle', 'TUNNEL',24,true);
	objectPlayAnimation('ticking_tunnel','idle',false)
	scaleObject('ticking_tunnel', 1.75, 1.75);
	addLuaSprite('ticking_tunnel', false);
end