function onCreate()
	makeLuaSprite('lulla', 'covers/hypno', 0, 0);
	addLuaSprite('lulla', false);
end

function onUpdate()
	if not inGameOver then
		doTweenColor('darkbambi', 'boyfriend', '949494', 0.1, 'linear')
		doTweenColor('darkdave', 'dad', '949494', 0.1, 'linear')
	end
end