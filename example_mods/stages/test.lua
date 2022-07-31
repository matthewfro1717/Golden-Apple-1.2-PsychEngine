function onCreate()
	-- background shit
	makeLuaSprite('trist', 'trist', -500, -150);
	setScrollFactor('trist', 0.9, 0.9);
	addGlitchEffect('trist', 2, 5, 0.1)
	addLuaSprite('trist',false)
	
	makeLuaSprite('tristan_gang', 'tristan_gang', 100, 130);
	addLuaSprite('tristan_gang', false)
	
	makeLuaSprite('daverson', 'daverson', -375, 100);
	addLuaSprite('daverson', false)
	end

function onStartCountdown()
	doTweenAngle('anglelele', 'trist', 14040, 205, 'linear');
end