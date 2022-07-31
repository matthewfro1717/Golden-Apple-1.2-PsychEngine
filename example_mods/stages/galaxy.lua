function onCreate()
	makeLuaSprite('galaxy', 'galaxy', -1475, -775);
	scaleObject('galaxy', 1.75, 1.75);
	addLuaSprite('galaxy', false)
end

function onSongStart()
	doTweenColor('darkbf', 'boyfriend', '949494', 1, 'linear')
	doTweenColor('darkbamb', 'dad', '949494', 1, 'linear')
	doTweenColor('darkgf', 'gf', '949494', 1, 'linear')

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end