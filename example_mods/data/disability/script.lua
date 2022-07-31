local angley = 0
function onCountdownTick(counter)
	if counter == 0 then
		noteTweenAngle('swoosh0', 0, angley + 2075, 3, 'cubeInOut')
		noteTweenAngle('swoosh1', 1, angley + 2075, 3, 'cubeInOut')
		noteTweenAngle('swoosh2', 2, angley + 2075, 3, 'cubeInOut')
		noteTweenAngle('swoosh3', 3, angley + 2075, 3, 'cubeInOut')
		noteTweenAngle('swoosh4', 4, angley + 2075, 3, 'cubeInOut')
		noteTweenAngle('swoosh5', 5, angley + 2075, 3, 'cubeInOut')
		noteTweenAngle('swoosh6', 6, angley + 2075, 3, 'cubeInOut')
		noteTweenAngle('swoosh7', 7, angley + 2075, 3, 'cubeInOut')
	end
end

function onTweenCompleted(tag)
	if tag == 'swoosh0' then
		angley = angley + 2075
		noteTweenAngle('swoosh0', 0, angley + 2075, 3, 'cubeInOut')
		noteTweenAngle('swoosh1', 1, angley + 2075, 3, 'cubeInOut')
		noteTweenAngle('swoosh2', 2, angley + 2075, 3, 'cubeInOut')
		noteTweenAngle('swoosh3', 3, angley + 2075, 3, 'cubeInOut')
		noteTweenAngle('swoosh4', 4, angley + 2075, 3, 'cubeInOut')
		noteTweenAngle('swoosh5', 5, angley + 2075, 3, 'cubeInOut')
		noteTweenAngle('swoosh6', 6, angley + 2075, 3, 'cubeInOut')
		noteTweenAngle('swoosh7', 7, angley + 2075, 3, 'cubeInOut')
	end
end

function onUpdate(elapsed)
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/5000)*(curBpm/60)
	doTweenY('opponentmove', 'dad', 150 - 150*math.sin((currentBeat+12*12)*math.pi), 2)
	end