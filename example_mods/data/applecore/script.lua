local followchars = false;
local floty = false
function onStartCountdown()
	precacheImage('monkey_guy')
	precacheImage('monkey_person')
	precacheSound('suck')
	precacheSound('suckEnd')
	math.randomseed(os.time());
	cycle = math.random(0, 32);
	cycle2 = math.random(0, 32);
	cycle3 = math.random(0, 32);
end

function opponentNoteHit()
	if curBeat >= 520 then
		health = getProperty('health')
		setProperty('health', health- 0.005);
	end
end

function onBeatHit()
	if curBeat == 192 then
       		triggerEvent('Zoom', 0.5, '')
		followchars = true
		doTweenAngle('minionspin', 'minion', 20250, 150)
		doTweenAngle('minion2spin', 'minion2', 20250, 150)
		doTweenAngle('minion3spin', 'minion3', 20250, 150)
		setProperty('poopsky.visible', true)
		setProperty('pizza.visible', false)
		setProperty('pizza2.visible', false)
	end
	if curBeat == 200 then
		doTweenY('bambidescend', 'bambi', -100, 1, 'circOut')
		setProperty('minion.visible', true)
		setProperty('minion2.visible', true)
		setProperty('minion3.visible', true)
	end
	if curBeat == 496 then
		isdownscroll = getPropertyFromClass('ClientPrefs', 'downScroll')
		isghosttapping = getPropertyFromClass('ClientPrefs', 'ghostTapping')
		setProperty('health', 2);
		if difficulty == 2 and not isdownscroll then
			setPropertyFromClass('ClientPrefs', 'downScroll', true)
		end
		if difficulty == 2 and isghosttapping then
			setPropertyFromClass('ClientPrefs', 'ghostTapping', false)
			makeLuaText('warning', 'Ghost Tapping is forced off.', 0, 5, screenHeight - 35)
    			setTextSize('warning', 20)
    			setTextBorder('warning', 2, '000000')
    			setTextColor('warning', 'ff0000')
    			setTextAlignment('warning', 'left')
    			setTextFont('warning', 'comic-sans-ms.ttf')
    			addLuaText('warning')
    			setObjectCamera('warning', 'hud')
		end
		setProperty('minion.visible', false)
		setProperty('minion2.visible', false)
		setProperty('minion3.visible', false)
		setProperty('deathbg.visible', true)
		setProperty('deathsky.visible', true)
	end
	if curBeat == 516 then
		setProperty('unfair.visible', true)
		doTweenAlpha('funi', 'unfair', 1, 1)
	end
	if curBeat == 520 then
		doTweenX('enlargex', 'unfair.scale', 3, 1, 'sineInOut')
		doTweenY('enlargey', 'unfair.scale', 3, 1, 'sineInOut')
	end
	if curBeat == 522 then
		cancelTween('skyangle')
		cancelTween('poopangle')
		removeLuaSprite('phonesky', true)
		removeLuaSprite('poopsky', true)
		removeLuaSprite('pizza', true)
		removeLuaSprite('pizza2', true)
		setProperty('unfair.visible', false)
		playSound('suck', 1, 'suck')
		xx = getProperty('dad.x')
		makeLuaSprite('monkeboy', 'monkey_guy', xx, 100)
		addLuaSprite('monkeboy', true)
		cancelTween('bandu1')
		cancelTween('bandu2')
		removeLuaSprite('bambi')
		makeLuaSprite('monkeman', 'monkey_person', -200, 0)
		addLuaSprite('monkeman', true)
		triggerEvent('Change Character','1','unfair')
		setObjectOrder('dadGroup', 5)
  		setProperty('monkeboy.antialiasing', false)
  		setProperty('monkeman.antialiasing', false)
		doTweenX('consumeboy', 'monkeboy', 300, 1, 'circIn')
		doTweenY('consumeboyy', 'monkeboy', -300, 1, 'circIn')
		doTweenX('consumeman', 'monkeman', 400, 1, 'circIn')
		doTweenY('consumemann', 'monkeman', -300, 1, 'circIn')
		doTweenX('consumeboys', 'monkeboy.scale', 0, 1, 'circIn')
		doTweenY('consumeboyys', 'monkeboy.scale', 0, 1, 'circIn')
		doTweenX('consumemans', 'monkeman.scale', 0, 1, 'circIn')
		doTweenY('consumemanns', 'monkeman.scale', 0, 1, 'circIn')
		doTweenAngle('consumespinboy', 'monkeboy', 360, 1, 'circIn')
		doTweenAngle('consumespinman', 'monkeman', -360, 1, 'circIn')
	end
	if curBeat == 524 then
		stopSound('suck')
		playSound('suckEnd', 1)
	end
end

function onTweenCompleted(tag)
	if tag == 'bambidescend' then
		floty = true
	end
end
		

function onPause()
	if curBeat >= 496 and difficulty == 2 and not isdownscroll then
		setPropertyFromClass('ClientPrefs', 'downScroll', false)
	end
	if curBeat >= 496 and difficulty == 2 and isghosttapping then
		setPropertyFromClass('ClientPrefs', 'ghostTapping', true)
	end
	return Function_Continue;
end

function onResume()
	if curBeat >= 496 and difficulty == 2 and not isdownscroll then
		setPropertyFromClass('ClientPrefs', 'downScroll', true)
	end
	if curBeat >= 496 and difficulty == 2 and isghosttapping then
		setPropertyFromClass('ClientPrefs', 'ghostTapping', false)
	end
end

function onUpdate(elapsed)
   	if followchars == true then
		if curBeat >= 192 and curBeat <= 524 then
        		if mustHitSection == false then
              			triggerEvent('Camera Follow Pos', 400, 400)
			else
				triggerEvent('Camera Follow Pos', '1000', '500')
			end
		end
		if curBeat >= 524 then
			triggerEvent('Camera Follow Pos', '', '')
        		if mustHitSection == false then
       				triggerEvent('Zoom', 0.3, '')
			else
				triggerEvent('Zoom', 0.5, '')
			end
		end
	end
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/4000)*(curBpm/60)
	started = true
	doTweenX('pizzer', 'pizza', 1000 + (math.cos((currentBeat) + cycle) * -1500), 0.05)
	doTweenY('pizzapie', 'pizza', -300 + (math.sin((currentBeat) + cycle) * 1000), 0.05)
	doTweenX('dominoes', 'pizza2', 700 + (math.sin((currentBeat*1.2) + cycle2) * -1500), 0.05)
	doTweenY('hut', 'pizza2', 1000 + (math.cos((currentBeat*1.2) + cycle2) * 1000), 0.05)
	doTweenX('dominoe2s', 'pizza2', 700 + (math.sin((currentBeat*1.2) + cycle3) * -1500), 0.05)
	doTweenY('hut2', 'pizza2', 1000 + (math.cos((currentBeat*1.2) + cycle3) * 1000), 0.05)
	if curBeat >= 192 then
		doTweenX('pizzer', 'minion', 700 + (math.cos((currentBeat) + cycle) * -2000), 0.05)
		doTweenY('pizzapie', 'minion', -700 + (math.sin((currentBeat) + cycle) * 1500), 0.05)
		doTweenX('dominoes', 'minion2', 300 + (math.sin((currentBeat*0.8) + cycle2) * -2000), 0.05)
		doTweenY('hut', 'minion2', 1000 + (math.cos((currentBeat*0.8) + cycle2) * 1500), 0.05)
		doTweenY('hut2', 'minion3', 1000 + (math.cos((currentBeat*0.8) + cycle3) * 1500), 0.05)
		doTweenX('dominoe2s', 'minion3', 300 + (math.sin((currentBeat*0.8) + cycle3) * -2000), 0.05)
	end
	if floty == true then
		doTweenY('bambifloats', 'bambi', -100 - 100*math.sin((currentBeat*0.75)*math.pi), 0.05)
	end
	if difficulty == 1 then
		if curBeat >= 192 then	
			noteTweenX('PlayerStrumX0', 4, defaultPlayerStrumX0 + (math.sin((currentBeat) + 0) * 40), 0.05)
			noteTweenX('PlayerStrumX1', 5, defaultPlayerStrumX1 + (math.sin((currentBeat) + 16) * 40), 0.05)
			noteTweenX('PlayerStrumX2', 6, defaultPlayerStrumX2 + (math.sin((currentBeat) + 0) * 40), 0.05)
			noteTweenX('PlayerStrumX3', 7, defaultPlayerStrumX3 + (math.sin((currentBeat) + 16) * 40), 0.05)
			noteTweenY('PlayerStrumY0', 4, defaultPlayerStrumY0 + (math.cos((currentBeat) + 0) * 40), 0.05)
			noteTweenY('PlayerStrumY1', 5, defaultPlayerStrumY1 + (math.cos((currentBeat) + 16) * 40), 0.05)
			noteTweenY('PlayerStrumY2', 6, defaultPlayerStrumY2 + (math.cos((currentBeat) + 0) * 40), 0.05)
			noteTweenY('PlayerStrumY3', 7, defaultPlayerStrumY3 + (math.cos((currentBeat) + 16) * 40), 0.05)
			noteTweenX('OpponentStrumX0', 0, defaultOpponentStrumX0 + (math.sin((currentBeat) + 0) * 40), 0.05)
			noteTweenX('OpponentStrumX1', 1, defaultOpponentStrumX1 + (math.sin((currentBeat) + 16) * 40), 0.05)
			noteTweenX('OpponentStrumX2', 2, defaultOpponentStrumX2 + (math.sin((currentBeat) + 0) * 40), 0.05)
			noteTweenX('OpponentStrumX3', 3, defaultOpponentStrumX3 + (math.sin((currentBeat) + 16) * 40), 0.05)
			noteTweenY('OpponentStrumY0', 0, defaultOpponentStrumY0 + (math.cos((currentBeat) + 0) * 40), 0.05)
			noteTweenY('OpponentStrumY1', 1, defaultOpponentStrumY1 + (math.cos((currentBeat) + 16) * 40), 0.05)
			noteTweenY('OpponentStrumY2', 2, defaultOpponentStrumY2 + (math.cos((currentBeat) + 0) * 40), 0.05)
			noteTweenY('OpponentStrumY3', 3, defaultOpponentStrumY3 + (math.cos((currentBeat) + 16) * 40), 0.05)
		end
	end
	if difficulty == 2 then
		if curBeat >= 192 and curBeat <= 495 then
			noteTweenX('PlayerStrumX0', 4, defaultPlayerStrumX0 + (math.sin((currentBeat) + 0) * 60), 0.05)
			noteTweenX('PlayerStrumX1', 5, defaultPlayerStrumX1 + (math.sin((currentBeat) + 16) * 60), 0.05)
			noteTweenX('PlayerStrumX2', 6, defaultPlayerStrumX2 + (math.sin((currentBeat) + 0) * 60), 0.05)
			noteTweenX('PlayerStrumX3', 7, defaultPlayerStrumX3 + (math.sin((currentBeat) + 16) * 60), 0.05)
			noteTweenY('PlayerStrumY0', 4, defaultPlayerStrumY0 + (math.cos((currentBeat) + 0) * 60), 0.05)
			noteTweenY('PlayerStrumY1', 5, defaultPlayerStrumY1 + (math.cos((currentBeat) + 16) * 60), 0.05)
			noteTweenY('PlayerStrumY2', 6, defaultPlayerStrumY2 + (math.cos((currentBeat) + 0) * 60), 0.05)
			noteTweenY('PlayerStrumY3', 7, defaultPlayerStrumY3 + (math.cos((currentBeat) + 16) * 60), 0.05)
			noteTweenX('OpponentStrumX0', 0, defaultOpponentStrumX0 + (math.sin((currentBeat) + 0) * 60), 0.05)
			noteTweenX('OpponentStrumX1', 1, defaultOpponentStrumX1 + (math.sin((currentBeat) + 16) * 60), 0.05)
			noteTweenX('OpponentStrumX2', 2, defaultOpponentStrumX2 + (math.sin((currentBeat) + 0) * 60), 0.05)
			noteTweenX('OpponentStrumX3', 3, defaultOpponentStrumX3 + (math.sin((currentBeat) + 16) * 60), 0.05)
			noteTweenY('OpponentStrumY0', 0, defaultOpponentStrumY0 + (math.cos((currentBeat) + 0) * 60), 0.05)
			noteTweenY('OpponentStrumY1', 1, defaultOpponentStrumY1 + (math.cos((currentBeat) + 16) * 60), 0.05)
			noteTweenY('OpponentStrumY2', 2, defaultOpponentStrumY2 + (math.cos((currentBeat) + 0) * 60), 0.05)
			noteTweenY('OpponentStrumY3', 3, defaultOpponentStrumY3 + (math.cos((currentBeat) + 16) * 60), 0.05)
		end
		if curBeat >= 496 then
			noteTweenX('PlayerStrumX0', 4, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 0) * 300), 0.05)
			noteTweenX('PlayerStrumX1', 5, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 1) * 300), 0.05)
			noteTweenX('PlayerStrumX2', 6, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 2) * 300), 0.05)
			noteTweenX('PlayerStrumX3', 7, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 3) * 300), 0.05)
			noteTweenY('PlayerStrumY0', 4, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 0) * 300), 0.05)
			noteTweenY('PlayerStrumY1', 5, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 1) * 300), 0.05)
			noteTweenY('PlayerStrumY2', 6, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 2) * 300), 0.05)
			noteTweenY('PlayerStrumY3', 7, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 3) * 300), 0.05)
			noteTweenX('OpponentStrumX0', 0, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat*2) + (4) * 2) * 300), 0.05)
			noteTweenX('OpponentStrumX1', 1, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat*2) + (5) * 2) * 300), 0.05)
			noteTweenX('OpponentStrumX2', 2, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat*2) + (6) * 2) * 300), 0.05)
			noteTweenX('OpponentStrumX3', 3, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat*2) + (7) * 2) * 300), 0.05)
			noteTweenY('OpponentStrumY0', 0, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat*2) + (4) * 2) * 300), 0.05)
			noteTweenY('OpponentStrumY1', 1, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat*2) + (5) * 2) * 300), 0.05)
			noteTweenY('OpponentStrumY2', 2, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat*2) + (6) * 2) * 300), 0.05)
			noteTweenY('OpponentStrumY3', 3, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat*2) + (7) * 2) * 300), 0.05)
		end
	end
	if curBeat >= 524 then
		doTweenX('expunged', 'dad', 300 + (math.cos(currentBeat) * 400), 0.05)
		doTweenY('expungedd', 'dad', 0 + (math.sin(currentBeat) * 200), 0.05)
	end
end

function onGameOver()
	if difficulty == 2 and not isdownscroll then
		setPropertyFromClass('ClientPrefs', 'downScroll', false)
	end
	if difficulty == 2 and isghosttapping then
		setPropertyFromClass('ClientPrefs', 'ghostTapping', true)
	end
	return Function_Continue;
end

function onEndSong()
	if difficulty == 2 and not isdownscroll then
		setPropertyFromClass('ClientPrefs', 'downScroll', false)
	end
	if difficulty == 2 and isghosttapping then
		setPropertyFromClass('ClientPrefs', 'ghostTapping', true)
	end
	return Function_Continue;
end