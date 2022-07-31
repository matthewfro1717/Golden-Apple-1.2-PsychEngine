function onCreate()
	makeLuaSprite('facecam', 'facecam', 600, 200);
	addLuaSprite('facecam', false);
	
	makeLuaSprite('onaf', 'onaf', 677, 200);
	addLuaSprite('onaf', true);
	
	makeAnimatedLuaSprite('flumpty', 'flumpty', 1350, 500);
	luaSpriteAddAnimationByPrefix('flumpty', 'idle', 'idle');
	scaleObject('flumpty', 0.6, 0.6);
	addLuaSprite('flumpty', true);
end

function onBeatHit()
	-- triggered 4 times per section
	luaSpritePlayAnimation('flumpty', 'idle', true);
end