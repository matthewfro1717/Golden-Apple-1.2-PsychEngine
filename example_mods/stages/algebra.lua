function onCreate()
	makeLuaSprite('algebra/algebraBg', 'algebra/algebraBg', -1200, -550);
	scaleObject('algebra/algebraBg', 1.75, 1.75);
	addLuaSprite('algebra/algebraBg', false)
	
	makeLuaSprite('garrett', 'algebra/bitch', -120, 0);
	scaleObject('garrett', 1.35, 1.35);
	setProperty('garrett.visible', false)
	addLuaSprite('garrett', false)
	
	makeLuaSprite('diamond', 'algebra/lanceyIsGoingToMakeAFakeLeakAndPostItInGeneral', 600, -100);
	scaleObject('diamond', 1.35, 1.35);
	setProperty('diamond.visible', false)
	addLuaSprite('diamond', false)
	
	makeLuaSprite('dave', 'algebra/dave', 250, 130);
	scaleObject('dave', 1.35, 1.35);
	setProperty('dave.visible', false)
	addLuaSprite('dave', false)
	
	makeAnimatedLuaSprite('davea', 'algebra/davePiss', 265, 55);
	addAnimationByPrefix('davea', 'idle', 'idle',24,true);
	objectPlayAnimation('davea','idle',false)
	scaleObject('davea', 1.35, 1.35);
	setProperty('davea.visible', false)
	addLuaSprite('davea', false)
	
	makeLuaSprite('hm', 'algebra/rubyIsAngryRN', 1300, 75);
	scaleObject('hm', 1.35, 1.35);
	setProperty('hm.visible', false)
	addLuaSprite('hm', false)
	
	makeLuaSprite('robot', 'algebra/myInternetJustWentOut', -1000, 375);
	scaleObject('robot', 1.35, 1.35);
	setProperty('robot.visible', false)
	addLuaSprite('robot', false)
end