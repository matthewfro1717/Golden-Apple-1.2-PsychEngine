function onCreate()
	makeLuaSprite('schoolStatic', 'schoolBG', defaultPlayerStrumX0 - 1670, defaultPlayerStrumY0 - 650);
	scaleObject('schoolStatic', 1.8, 1.8)
	addLuaSprite('schoolStatic', false);

	makeAnimatedLuaSprite('FUCKING RUN YOU IDIOT', 'run', defaultPlayerStrumX0 - 1670, defaultPlayerStrumY0 - 750);
	addAnimationByPrefix('FUCKING RUN YOU IDIOT', 'ran', 'Symbol', 60, true)
	scaleObject('FUCKING RUN YOU IDIOT', 1.8, 1.8)
	addLuaSprite('FUCKING RUN YOU IDIOT', false);
	setProperty('FUCKING RUN YOU IDIOT.visible', false)

	makeAnimatedLuaSprite('palooseCar', 'car', -200, defaultPlayerStrumY0 + 50);
	addAnimationByPrefix('palooseCar', 'carThing', 'idle', 24, true)
	addLuaSprite('palooseCar', true);
	setProperty('palooseCar.visible', false)

	makeLuaSprite('jail', 'palooseJail', defaultPlayerStrumX0 - 1670, defaultPlayerStrumY0 - 650);
	scaleObject('jail', 1.8, 1.8)
	addLuaSprite('jail', false);
	setProperty('jail.visible', false)

	-- i hate offsets
	makeLuaSprite('funyPad', 'padFront', getPropertyFromClass('flixel.FlxG', 'width') - 1800, getPropertyFromClass('flixel.FlxG', 'height') - 1150)
	scaleObject('funyPad', 2, 2)
	setObjectOrder('funyPad', (getObjectOrder('boyfriendGroup') + 1))
	addLuaSprite('funyPad', false);

	makeLuaSprite('xd', '', -1000, -500)
  	makeGraphic('xd', 3000, 1720, 'ffffff')
  	addLuaSprite('xd')

	setProperty('funyPad.visible', false)
	setProperty('xd.visible', false)

	makeAnimatedLuaSprite('runStatic', 'run', defaultPlayerStrumX0 - 1670, defaultPlayerStrumY0 - 750)
	scaleObject('runStatic', 1.8, 1.8)
	addLuaSprite('runStatic', false);
	setProperty('runStatic.visible', false)

	
	makeAnimatedLuaSprite('leggi', 'leggi', -150, defaultPlayerStrumY0 - 100);
	addAnimationByPrefix('leggi', 'e', 'poop running down my leg', 24, true) --this xml name is not a joke. help
	objectPlayAnimation('leggi', 'e', true)
	scaleObject('leggi', 0.7, 0.7)
	addLuaSprite('leggi', false)
	setProperty('leggi.visible', false)
end

function onCreatePost()
	setProperty('gf.visible', false)

	for i = 0, getProperty('unspawnNotes.length')-1 do
		setPropertyFromGroup('grpNoteSplashes', i, 'visible', false)
	end

end

function goodNoteHit(isSustainNote)
	if isSustainNote then
		setProperty('health', getProperty('health') - 0.017)
	else
	end
end


function onUpdatePost(elapsed)
	if curStep > 3310 and curStep < 4720 then
    for i = 0, 3 do
        if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes_sick_and_cool');
					setPropertyFromGroup("unspawnNotes", i, "scale.x", 2)
					setPropertyFromGroup("unspawnNotes", i, "scale.y", 2)
					
				else
		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
        setPropertyFromGroup('unspawnNotes', i, 'texture', '3dnote')
		end
	end
end
end
end
function onStepHit()
	if curStep == 1200 then
	characterPlayAnim('dad', 'hi', true)
	setProperty('dad.specialAnim', true)
	end

	if curStep == 2160 then

		setProperty('leggi.y', defaultPlayerStrumY0 + 60)

		setProperty('leggi.visible', true)

		objectPlayAnimation('FUCKING RUN YOU IDIOT', 'ran', true)

		removeLuaSprite('schoolStatic', true)
		setProperty('FUCKING RUN YOU IDIOT.visible', true)

		setProperty('dad.flipX', true)
		setProperty('boyfriend.x', 10)
		setProperty('dad.x', 1300)

		noteTweenX('die', 0, defaultPlayerStrumX0, 0.6, 'circInOut')
		noteTweenX('did4e', 1, defaultPlayerStrumX1, 0.6, 'circInOut')
		noteTweenX('di4dae', 2, defaultPlayerStrumX2, 0.6, 'circInOut')
		noteTweenX('di4d33ae', 3, defaultPlayerStrumX3, 0.6, 'circInOut')
		
		noteTweenX('ahh', 4, defaultOpponentStrumX0, 0.6, 'circInOut')
		noteTweenX('ahhh', 5, defaultOpponentStrumX1, 0.6, 'circInOut')
		noteTweenX('ahhhh', 6, defaultOpponentStrumX2, 0.6, 'circInOut')
		noteTweenX('ahhhhh', 7, defaultOpponentStrumX3, 0.6, 'circInOut')
	end

	if curStep == 3216 then

		setProperty('FUCKING RUN YOU IDIOT.visible', false)
		setProperty('jail.visible', true)
		setProperty('leggi.visible', false)

		doTweenX('dadtween', 'dad', 3000, 3)

		noteTweenX('die32', 0, defaultOpponentStrumX0, 0.6, 'circInOut')
		noteTweenX('did3x434e', 1, defaultOpponentStrumX1, 0.6, 'circInOut')
		noteTweenX('di4x4343f3dae', 2, defaultOpponentStrumX2, 0.6, 'circInOut')
		noteTweenX('di4dx35433ae', 3, defaultOpponentStrumX3, 0.6, 'circInOut')
		
		noteTweenX('ah bth', 4, defaultPlayerStrumX0, 0.6, 'circInOut')
		noteTweenX('ahb hh', 5, defaultPlayerStrumX1, 0.6, 'circInOut')
		noteTweenX('ah btb5chhh', 6, defaultPlayerStrumX2, 0.6, 'circInOut')
		noteTweenX('ahhrerhhh', 7, defaultPlayerStrumX3, 0.6, 'circInOut')
	end

	if curStep == 3310 then
		removeLuaSprite('jail', true)
		setProperty('funyPad.visible', true)
		setProperty('xd.visible', true)

		noteTweenX('xr43xr34', 0, 198273, 0.00001, 'circInOut')
		noteTweenX('rx34rx43r43', 1, 198273, 0.00001, 'circInOut')
		noteTweenX('di4x3r43xrxr43xr43xr43dae', 2, 198273, 0.00001, 'circInOut')
		noteTweenX('di4dx43xr43xr43xr43xr4333ae', 3, 198273, 0.00001, 'circInOut')

		for i = 0, 3 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'notes_sick_and_cool')
			if not string.find(getPropertyFromGroup('notes', i, 'animation.curAnim.name'), 'hold') then
			setPropertyFromGroup("playerStrums", i, "scale.x", 2)
			setPropertyFromGroup("playerStrums", i, "scale.y", 2)
			end
		end


		setScrollFactor('boyfriend', 0, 0)
		setScrollFactor('dad', 0, 0)
		setScrollFactor('xd', 0, 0)
		setScrollFactor('funyPad', 0, 0)

		noteTweenX('xr47', 4, defaultPlayerStrumX0 + 100, 0.6, 'circInOut')
		noteTweenX('xr427', 5, defaultPlayerStrumX1 + 65, 0.6, 'circInOut')
		noteTweenX('xr4227', 6, defaultPlayerStrumX2 + 25, 0.6, 'circInOut')
		noteTweenX('xr2427', 7, defaultPlayerStrumX3 - 10, 0.6, 'circInOut')

		end

		if curStep == 4720 then

		removeLuaSprite('funyPad', true)
		removeLuaSprite('xd', true)

		setProperty('xd.visible', false)
		setProperty('funyPad.visible', false)
		setProperty('jail.visible', false)

		setScrollFactor('boyfriend', 1, 1)
		setScrollFactor('dad', 1, 1)

		setProperty('runStatic.visible', true)
		setProperty('schoolStatic.visible', false)
		setProperty('FUCKING RUN YOU IDIOT.visible', false)

		noteTweenX('33213123', 0, defaultOpponentStrumX0, 0.6, 'circInOut')
		noteTweenX('12312314', 1, defaultOpponentStrumX1, 0.6, 'circInOut')
		noteTweenX('45747567', 2, defaultOpponentStrumX2, 0.6, 'circInOut')
		noteTweenX('vy6y5', 3, defaultOpponentStrumX3, 0.6, 'circInOut')
		noteTweenX('c34r3', 4, defaultPlayerStrumX0, 0.6, 'circInOut')
		noteTweenX('c34r43r', 5, defaultPlayerStrumX1, 0.6, 'circInOut')
		noteTweenX('c34r43cccc', 6, defaultPlayerStrumX2, 0.6, 'circInOut')
		noteTweenX('c345345345', 7, defaultPlayerStrumX3, 0.6, 'circInOut')

		for i = 0, 3 do
			setPropertyFromGroup('playerStrums', i, 'texture', '3dnote')
			end
		end

		if curStep == 5904 then
			setProperty('runStatic.visible', false)
			setProperty('FUCKING RUN YOU IDIOT.visible', true)
		end

		if curStep == 7744 then
			setProperty('runStatic.visible', true)
			setProperty('FUCKING RUN YOU IDIOT.visible', false)
		end

		if curStep == 10992 then
			objectPlayAnimation('palooseCar', 'carThing', true)
			removeLuaSprite('runStatic', true)
			setProperty('FUCKING RUN YOU IDIOT.visible', true)
			setProperty('palooseCar.visible', true)

			setProperty('leggi.y', defaultPlayerStrumY0 - 100)
	setProperty('leggi.x', 1300)
	setProperty('FUCKING RUN YOU IDIOT.flipX', true)
	setProperty('boyfriend.x', 1400)

	setProperty('leggi.y', defaultPlayerStrumY0 - 100)
	setProperty('boyfriend.y', defaultPlayerStrumY0 - 320)
	setProperty('leggi.visible', true)
		end
	end