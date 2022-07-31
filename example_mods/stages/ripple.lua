function onCreate()	
	makeLuaSprite('ripple', 'ripple', -1475, -775)
	scaleObject('ripple', 1.75, 1.75)
	addLuaSprite('ripple', false)  
end

function onStartCountdown()
	doTweenAngle('anglelele', 'ripple', 28080, 330, 'linear');
end