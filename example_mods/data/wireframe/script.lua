local blue = true;
function onCreate()
	makeAnimatedLuaSprite('badai', 'characters/badai', -900, -900)
	addAnimationByPrefix('badai', 'idleloop', 'IDLE', 24, true)
	scaleObject('badai', 0.8, 0.8)
	setProperty('badai.visible', false)
	addLuaSprite('badai', false)

	makeAnimatedLuaSprite('flyingdave', 'pissBoy', 300, 800)
	addAnimationByPrefix('flyingdave', 'idle', 'IDLE', 24, false)
	addAnimationByPrefix('flyingdave', 'edge', 'EDGE', 24, false)
	scaleObject('flyingdave', 0.7, 0.7)
	setProperty('flyingdave.visible', false)
	addLuaSprite('flyingdave', false)

	setObjectOrder('dadGroup', 10)
end

function onCreatePost()
    	setProperty('gf.alpha', 0);
	objectPlayAnimation('badai', 'idleloop', true)
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('flyingdave', 'idle', false);
	end
end
function goodNoteHit()
	triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.005');
end

function opponentNoteHit()
	triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.005');
end

function onUpdate(elapsed)
	triggerEvent('Screen Shake', '0.01, 0.0025', '')
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/5000)*(curBpm/120)
	doTweenY('opponentmove', 'dad', 100 - 200*math.sin((currentBeat+1)*math.pi), 4)
	doTweenY('bfmove', 'boyfriend', 50 + 200*math.sin((currentBeat+1)*math.pi), 4)
	if curBeat == 254 then
		setProperty('badai.visible', true)
		doTweenY('baday', 'badai', 0, 0.3, 'sineIn')
		doTweenX('badax', 'badai', -200, 0.3, 'sineIn')
	end
	if curBeat >= 256 then
		setProperty('badai.visible', false)
		doTweenX('opponentmoves', 'dad', -250 + 250*math.sin((currentBeat+1)*math.pi), 4)
		doTweenY('opponentmove', 'dad', 150 + 200*math.sin((currentBeat+1)*math.pi), 4)
		doTweenAngle('opponentmovess', 'dad', 0 + 30*math.cos((currentBeat+1)*math.pi), 4)
	end
	if curBeat == 264 then
		setProperty('flyingdave.visible', true)
		doTweenY('davefly', 'flyingdave', -100, 0.3, 'cubeOut')
		doTweenAngle('flyingdavespin', 'flyingdave', 360, 20)
		runTimer('playanim', 9)
		doTweenX('davex', 'flyingdave', 1100, 8)
		doTweenY('davey', 'flyingdave', 500, 8)
	end
   	if blue == true then
      	      	if getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss' then
                	doTweenColor('missboyfriend', 'boyfriend', '0000ff', 0.05, 'linear')
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss' then 
                	doTweenColor('missboyfriend', 'boyfriend', '0000ff', 0.05, 'linear')
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss' then 
                	doTweenColor('missboyfriend', 'boyfriend', '0000ff', 0.05, 'linear')
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss' then
                	doTweenColor('missboyfriend', 'boyfriend', '0000ff', 0.05, 'linear')
		end
            	if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
			doTweenColor('hitboyfriend', 'boyfriend', 'ffffff', 0.01, 'linear')
            	end
            	if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
			doTweenColor('hitboyfriend', 'boyfriend', 'ffffff', 0.01, 'linear')
            	end
            	if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
			doTweenColor('hitboyfriend', 'boyfriend', 'ffffff', 0.01, 'linear')
            	end
            	if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
			doTweenColor('hitboyfriend', 'boyfriend', 'ffffff', 0.01, 'linear')
            	end
            	if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
			doTweenColor('hitboyfriend', 'boyfriend', 'ffffff', 0.01, 'linear')
            	end
	end
end

local angle = 0

function onTweenCompleted(tag)
	if tag == 'davex' then
		doTweenX('davex2', 'flyingdave', 300, 8)
	end
	if tag == 'davex2' then
		runTimer('playanim', 9)
		doTweenX('davex', 'flyingdave', 1100, 8)
	end
	if tag == 'davey' then
		doTweenY('davey2', 'flyingdave', -100, 8)
	end
	if tag == 'davey2' then
		doTweenY('davey', 'flyingdave', 500, 8)
	end
	if tag == 'flyingdavespin' then
		angle = angle + 360
		doTweenAngle('flyingdavespin', 'flyingdave', 360 + angle, 20)
	end
end

function onTimerCompleted(tag)
	if tag == 'playanim' then
		objectPlayAnimation('flyingdave', 'edge', true)
	end
end