function onCreate()
	makeLuaSprite('hi', -1700, -900);
	scaleObject('hi', 2, 2);
	addGlitchEffect('hi', 2, 5, 0.1)
	addLuaSprite('hi', false)

    makeLuaSprite('poop', -1700, -900);
	scaleObject('poop', 2, 2);
	addGlitchEffect('poop', 2, 5, 0.1)
	addLuaSprite('poop', false)

	makeLuaSprite('yeah', -1700, -1350);
	scaleObject('yeah', 2, 2);
	addGlitchEffect('yeah', 2, 5, 0.1)
	addLuaSprite('yeah', false)

	makeAnimatedLuaSprite('pizza', 'pizza', 0, 0)
	addAnimationByPrefix('pizza', 'spin', 'p', 12, true)
	scaleObject('pizza', 0.9, 0.9);
	setProperty('pizza.antialiasing', false)
	addLuaSprite('pizza', false)

	makeAnimatedLuaSprite('minion', 'minion', 0, 0)
	addAnimationByPrefix('minion', 'walk', 'poip', 12, true)
	scaleObject('minion', 0.8, 0.8);
	setProperty('minion.visible', false)
	setProperty('minion.antialiasing', false)
	addLuaSprite('minion', false)

	makeAnimatedLuaSprite('pizza2', 'pizza', -100, 0)
	addAnimationByPrefix('pizza2', 'spin', 'p', 12, true)
	scaleObject('pizza2', 0.9, 0.9);
	setProperty('pizza2.antialiasing', false)
	addLuaSprite('pizza2', false)

	makeAnimatedLuaSprite('minion2', 'minion', -100, 0)
	addAnimationByPrefix('minion2', 'walk', 'cartwheel', 12, true)
	scaleObject('minion2', 0.8, 0.8);
	setProperty('minion2.visible', false)
	setProperty('minion2.antialiasing', false)
	addLuaSprite('minion2', false)
	
	makeAnimatedLuaSprite('minion3', 'minion', -200, 0)
	addAnimationByPrefix('minion3', 'walk', 'god i love trampolining', 12, true)
	scaleObject('minion3', 0.8, 0.8);
	setProperty('minion3.visible', false)
	setProperty('minion3.antialiasing', false)
	addLuaSprite('minion3', false)

	makeAnimatedLuaSprite('bambi', 'characters/bambi_pissyboy', -400, -1500); -- change 'character' to the name of your character, change 'dad' to the name of the .png and .xml file

	addAnimationByIndices('bambi', 'danceLeft', 'idle', '1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11');
	addAnimationByIndices('bambi', 'danceRight', 'idle', '13, 14, 15, 16, 17, 18, 19, 20, 21, 22'); -- change 'character' to the name of your character, don't change 'idle', change 'Dad idle dance' to the idle animation in your xml file
	addAnimationByPrefix('bambi', 'singLEFT', 'left', 24, false); -- repeat this for each one ^^^
	addAnimationByPrefix('bambi', 'singDOWN', 'down', 24, false);
	addAnimationByPrefix('bambi', 'singUP', 'up', 24, false);
	addAnimationByPrefix('bambi', 'singRIGHT', 'right', 24, false);

	objectPlayAnimation('bambi', 'Left'); -- change 'character'
	addLuaSprite('bambi', true); -- change 'character' to the name of your character and put the 'false' to true if you want the character to be in front of the original characters

	makeAnimatedLuaSprite('unfair', 'characters/UNFAIR_GUY_FAICNG_FORWARD', 100, -250)
	addAnimationByPrefix('unfair', 'idle', 'idle', 24, false);
	setProperty('unfair.visible', false)
	doTweenAlpha('funi', 'unfair', 0, 0.1)
	addLuaSprite('unfair', false);

end

function onCreatePost()
  	setProperty('bambi.antialiasing', false)
  	setProperty('unfair.antialiasing', false)
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'bambi' then
		triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.005');
		health = getProperty('health')
		setProperty('health', health- 0.007);
		objectPlayAnimation('bambi', singAnims[direction + 1], true)
	end
end

function onBeatHit()
	if curBeat % 1 == 0 then
		objectPlayAnimation('unfair', 'idle');
	end
	if curBeat % 2 == 0 then
		objectPlayAnimation('bambi', 'danceRight');
		objectPlayAnimation('unfair', 'idle');
	end
	-- triggered 4 times per section
	if curBeat % 4 == 0 then
		objectPlayAnimation('bambi', 'danceLeft');
	end
end

function onStartCountdown()
	doTweenX('bandu1', 'dad', 1200, 1.2, 'sineInOut')
	triggerEvent('Camera Follow Pos','1000','500')
	doTweenAngle('angle', 'hi', 28080, 330, 'linear');
	doTweenAngle('poopangle', 'poop', 28080, 330, 'linear');
	doTweenAngle('deathangle', 'yeah', 28080, 330, 'linear');
end

function onTweenCompleted(tag)
	if tag == 'bandu1' then
		if curBeat <= 520 then
			doTweenX('bandu2', 'dad', 200, 1.2, 'sineInOut')
			setObjectOrder('dadGroup', 15)
		end
	end
	if tag == 'bandu2' then
		if curBeat >= 192 and curBeat <= 198 then
			triggerEvent('Change Character','1','bandu-sad')
		end
		if curBeat <= 520 then
			doTweenX('bandu1', 'dad', 1200, 1.2, 'sineInOut')
			setObjectOrder('dadGroup', 12)
		end
	end
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 2 == 0 then
		objectPlayAnimation('bambi', 'idle');
	end
end