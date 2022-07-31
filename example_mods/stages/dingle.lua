function onCreate()
	makeLuaSprite('dingle/sky', 'dingle/sky', -200, -150);
	setLuaSpriteScrollFactor('dingle/sky', 0, 0);
	scaleObject('dingle/sky', 2, 2);
	addLuaSprite('dingle/sky', false);
	
	makeLuaSprite('dingle/city', 'dingle/city', -400, -450);
	setLuaSpriteScrollFactor('dingle/city', 0, 0);
	scaleObject('dingle/city', 2.5, 2.5);
	addLuaSprite('dingle/city', false);
	
	makeLuaSprite('dingle/street', 'dingle/street', -400, -200);
	scaleObject('dingle/street', 2.5, 2.5);
	addLuaSprite('dingle/street', false);
	
	
	makeLuaSprite('dingle/behindTrain', 'dingle/behindTrain', -400, -200);
	scaleObject('dingle/behindTrain', 2, 2);
	addLuaSprite('dingle/behindTrain', false);
	
	makeLuaSprite('dingle/sludd', 'dingle/sludd', -200, -150);
	setLuaSpriteScrollFactor('dingle/sludd', 0, 0);
	scaleObject('dingle/sludd', 2, 2);
	setProperty('dingle/sludd.visible', false)
	addLuaSprite('dingle/sludd', false);
	
	makeLuaSprite('dingle/water', 'dingle/water', -200, -300);
	setLuaSpriteScrollFactor('dingle/water', 0, 0);
	scaleObject('dingle/water', 2, 2);
	setProperty('dingle/water.visible', false)
	addLuaSprite('dingle/water', false);
	
	makeLuaSprite('dingle/sand', 'dingle/sand', -450, -150);
	scaleObject('dingle/sand', 2.5, 2.5);
	setProperty('dingle/sand.visible', false)
	addLuaSprite('dingle/sand', false);
	
	makeAnimatedLuaSprite('dingle/crowd', 'dingle/crowd', 100, -100);
	luaSpriteAddAnimationByPrefix('dingle/crowd', 'idle', 'bop');
	scaleObject('dingle/crowd', 1.3, 1.3);
	setProperty('dingle/crowd.visible', false)
	addLuaSprite('dingle/crowd', false);
end

function onBeatHit()
	-- triggered 4 times per section
	luaSpritePlayAnimation('crowd', 'idle', true);
end