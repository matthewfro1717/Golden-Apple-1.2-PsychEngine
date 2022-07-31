function onCreate()
	makeLuaSprite('sky', 'sky', -600, -300);
	scaleObject('sky', 0.9, 0.9);
	addLuaSprite('sky', false);
	
	makeLuaSprite('clouds', 'clouds', -300, -100);
	addLuaSprite('clouds', false);
	
	makeLuaSprite('grass', 'grass', -600, -100);
	addLuaSprite('grass', false);
	
	makeLuaSprite('props', 'props', -600, -300);
	scaleObject('props', 1.2, 1.2);
	addLuaSprite('props', false);
	
	makeAnimatedLuaSprite('tristan_crowd', 'tristan_crowd', 500, 350);
	luaSpriteAddAnimationByPrefix('tristan_crowd', 'idle', 'crowd');
	scaleObject('tristan_crowd', 0.8, 0.8);
	addLuaSprite('tristan_crowd', false);
	
	makeAnimatedLuaSprite('davec', 'davec', -300, 250);
	luaSpriteAddAnimationByPrefix('davec', 'idle', 'idle');
	scaleObject('davec', 0.9, 0.9);
	addLuaSprite('davec', false);
	
    makeLuaSprite('trist', 'trist', -1475, -775);
    setProperty('trist.visible', false)
	scaleObject('trist', 3, 3);
	addLuaSprite('trist', false)
	
	makeLuaSprite('tristan_gang', 'tristan_gang', 100, 130);
	setProperty('tristan_gang.visible', false)
	addLuaSprite('tristan_gang', false)
	
	makeLuaSprite('daverson', 'daverson', -375, 100);
	setProperty('daverson.visible', false)
	addLuaSprite('daverson', false)
end

function onBeatHit()
	-- triggered 4 times per section
	luaSpritePlayAnimation('davec', 'idle', true);
	luaSpritePlayAnimation('tristan_crowd', 'idle', true);
end

function onStartCountdown()
	doTweenAngle('anglelele', 'trist', 14040, 205, 'linear');
end