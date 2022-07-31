-- PSYCH ENGINE: VANILLA RESKIN VIA. LUA --
-- CREDITS:
-- BombasticTom - Script creator
-- @cyn#5661 - Original Custom Healthbar Script (https://discord.com/channels/922849922175340586/922851578996744252/941509137601269800)
-- @Kevin Kuntz#7641 - Splash offsets lol
-- @SkyBaoFall#7925 - Static strums code (from kade engine botplay: https://cdn.discordapp.com/attachments/922851578996744252/967430611532939264/kade_engine_botplay.zip)
-- @Stilic#5989 - Combo popup on the counter (was too lazy to make one LMAOOO) (https://cdn.discordapp.com/attachments/922851578996744252/974003348158185523/noteComboPack.zip)
-- ninja_muffin99 - Reference Code :nerd:

local prototypeNerd = true

local isUsingGhost

local width = 593 -- default: 593
local height = 11 -- default: 11

local bar_offset_x = 0 -- default: 0
local bar_offset_y = 0 -- default: 0

local border_color = "000000"
local border_thickness = 4 -- default: 4

local override_colors = true -- default: false
local override_p1_color = override_colors and "00ff00" or nil
local override_p2_color = override_colors and "ff0000" or nil

local p1_offset_x = -26 -- default: -26
local p1_offset_y = 0 -- default: 0
local p2_offset_x = 26 -- default: 26
local p2_offset_y = 0 -- default: 0

--

function string.starts(str, start)
    return string.sub(str, 1, string.len(start)) == start
end
function string.split(str, sep)
    if sep == nil then sep = "%s" end
    local t = {}
    for str in string.gmatch(str, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

local count = 0

local function to_hex(rgb)
	return string.format("%x", (rgb[1] * 0x10000) + (rgb[2] * 0x100) + rgb[3])
end

local sprite_border = "healthbar_border"
local sprite_p1 = "healthbar_p1"
local sprite_p2 = "healthbar_p2"

local bar_origin_x 
local bar_origin_y

local p_origin_y

function remapToRange(value, start1, stop1, start2, stop2)
	return start2 + (value - start1) * ((stop2 - start2) / (stop1 - start1))
end

function lerp(a, b, ratio)
	return a + ratio * (b - a)
end

function onCreatePost()
	
	setProperty("healthBarBG.visible", false)
	setProperty("healthBar.visible", false)

	makeLuaSprite(
		sprite_border, 
		"healthBar",
		0,
		downscroll and 75 or screenHeight * 0.9
	)

	screenCenter(sprite_border, 'x')

	addLuaSprite(sprite_border, true)
	setObjectCamera(sprite_border, "hud")
	setObjectOrder(sprite_border, getObjectOrder('healthBarBG'))
	
	makeLuaSprite(sprite_p1, "",
		0,
		getProperty('healthbar_border.y') + 4
	)

	screenCenter(sprite_p1, 'x')

	makeGraphic(sprite_p1,
		(getProperty('healthbar_border.width') - 8) / 2,
		getProperty('healthbar_border.height') - 8,
		override_colors and override_p1_color or to_hex(getProperty("boyfriend.healthColorArray"))
	)

	addLuaSprite(sprite_p1, true)
	setObjectCamera(sprite_p1, "hud")
	setObjectOrder(sprite_p1, 2)
	setProperty(sprite_p1 .. ".origin.x", getProperty(sprite_p1 .. ".width"))
	
	makeLuaSprite(sprite_p2, "",
		getProperty('healthbar_border.x') + 5,
		getProperty('healthbar_border.y') + 4
	)
	makeGraphic(sprite_p2,
		getProperty('healthbar_border.width') - 9,
		getProperty('healthbar_border.height') - 8,
		override_colors and override_p2_color or to_hex(getProperty("dad.healthColorArray"))
	) 

	for i=0, getProperty('strumLineNotes.length')-1 do
		setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromClass('Note', 'swagWidth') * (i % 4) + 50 + (screenWidth / 2) * getPropertyFromGroup('strumLineNotes', i, 'player'))
		
		if getPropertyFromGroup('strumLineNotes', i, 'texture') == 'NOTE_assets' then -- prevents the game from overriding already assigned textures (like in Cross Console Crash)
			if getPropertyFromGroup('strumLineNotes', i, 'player') == 0 then
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'VanillaAssets/crap_assets')
				if middlescroll then setPropertyFromGroup('strumLineNotes', i, 'alpha', 1) end
			end
		end
	end
	

	addLuaSprite(sprite_p2, true)
	setObjectCamera(sprite_p2, "hud")
	setObjectOrder(sprite_p2, getObjectOrder('healthBar')-1)
	setObjectOrder(sprite_p1, getObjectOrder('healthBar'))
	setProperty(sprite_p2 .. ".origin.x", 0)

	setProperty('scoreTxt.visible', false)

	makeLuaText('score', 'Score: 0', 200, getProperty('healthbar_border.x') + getProperty('healthbar_border.width') - 190,  getProperty('healthbar_border.y') + 30)
	setTextSize('score', 16)
	setTextAlignment('score', 'left')
	addLuaText('score')
	setObjectOrder('score', getObjectOrder('healthbar_border'))
	setTextBorder('score', 1.75, '000000')

	setPropertyFromClass('lime.app.Application', 'current.window.title', "Friday Night Funkin'")
	setPropertyFromClass('Main', 'fpsVar.visible', 'false')

	if botPlay then
		setPropertyFromClass('ClientPrefs', 'cpuControlled', false)
		setProperty('cpuControlled', true)
		setProperty('botplayTxt.visible', false)	
	end

	isUsingGhost = getPropertyFromClass('ClientPrefs', 'ghostTapping')
	if isUsingGhost then
		setPropertyFromClass('ClientPrefs', 'ghostTapping', false)
	end

	hudHidden = getPropertyFromClass('ClientPrefs', 'hideHud')
	if not hudHidden then
		setPropertyFromClass('ClientPrefs', 'hideHud', true)
	end

	if not prototypeNerd then
		makeLuaText('proto', 'v0.3.0 (163ea06) PROTOTYPE', 300, 0, 0)
		setProperty('proto.x', screenWidth - getProperty('proto.width'))
		setProperty('proto.y', screenHeight - getProperty('proto.height'))
		setTextSize('proto', 16)
		setTextAlignment('proto', 'right')
		addLuaText('proto')
		setObjectOrder('proto', getObjectOrder('score'))
		setTextBorder('proto', 1.75, '000000')
	end
end

function onCountdownTick(count)
	if count == 0 then
		for i=0, getProperty('strumLineNotes.length')-1 do
			setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromClass('Note', 'swagWidth') * (i % 4) + 50 + (screenWidth / 2) * getPropertyFromGroup('strumLineNotes', i, 'player'))
		
			if getPropertyFromGroup('strumLineNotes', i, 'texture') == 'NOTE_assets' then -- prevents the game from overriding already assigned textures (like in Cross Console Crash)
				if getPropertyFromGroup('strumLineNotes', i, 'player') == 0 then
					setPropertyFromGroup('strumLineNotes', i, 'texture', 'VanillaAssets/crap_assets')
					if middlescroll then setPropertyFromGroup('strumLineNotes', i, 'alpha', 1) end
				end
			end
		end
	end

	--return Function_Continue;
end

function onUpdatePost(elapsed)
	local percent_p1 = (getProperty("healthBar.percent")/100)
	local percent_p2 = 1 - percent_p1

	local scale_p1 = (percent_p1 * 2) + (percent_p1 < 1 and 0.01 or 0)
	local scale_p2 = percent_p2 * 2 - (percent_p1 < 1 and 0.01 or 0)
	setProperty(sprite_p1 .. ".scale.x", scale_p1)

	setProperty("iconP2.y", getProperty('healthbar_border.y') + (getProperty("iconP2.height") / 2)-147)
	setProperty("iconP1.y", getProperty('healthbar_border.y') + (getProperty("iconP1.height") / 2)-147)

	for i = 0, getProperty('grpNoteSplashes.length')-1 do
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -30)
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', -30)
		setPropertyFromGroup('grpNoteSplashes', i, 'alpha', 0.6)
	end
end

function onBeatHit()
	scaleObject('iconP1', 1.15, 1.15)
	scaleObject('iconP2', 1.15, 1.15)
end

function goodNoteHit(a,b,c,isSustainNote)
	
    if getProperty('cpuControlled') and not isSustainNote then
		addScore(350)
    end

    setTextString('score', 'Score: '.. getProperty('songScore'))

    if not isSustainNote then

	local noteHitDelay = math.abs(getPropertyFromClass('Conductor', 'songPosition') - getPropertyFromGroup('notes', a, 'strumTime'))
	local myRating = judgeNote(noteHitDelay)

	local pixel = getPropertyFromClass('PlayState', 'isPixelStage')
        local pixelShitPart1 = ''
        local pixelShitPart2 = ''
        local scaleShit = 0.7
        local antialiasing = getPropertyFromClass('ClientPrefs',
                                                  'globalAntialiasing')
        if pixel then
            pixelShitPart1 = 'pixelUI/'
            pixelShitPart2 = '-pixel'
            scaleShit = getPropertyFromClass('PlayState', 'daPixelZoom') * 0.85
            antialiasing = false
        end

	count = count + 1

	makeLuaSprite('comboRating'..count, pixelShitPart1 .. myRating .. pixelShitPart2, 0, 0)
	screenCenter('comboRating'..count)
	setProperty('comboRating'..count..'.x', screenWidth * 0.55 - 40)
	setProperty('comboRating'..count..'.y', getProperty('comboRating'..count..'.y') - 60)

	if not pixel then
		setGraphicSize('comboRating'..count, getProperty('comboRating'..count..'.width') * 0.7)
	else
		setGraphicSize('comboRating'..count, getProperty('comboRating'..count..'.width') * scaleShit)
	end
	setProperty('comboRating'..count..'.antialiasing', antialiasing)

	updateHitbox('comboRating'..count)
	addLuaSprite('comboRating'..count, true)

	setProperty('comboRating'..count..'.acceleration.y', 550)
	setProperty('comboRating'..count..'.velocity.y', getProperty('comboRating'..count..'.velocity.y') - math.random(140, 175))
	setProperty('comboRating'..count..'.velocity.x', math.random(0, 10))
	runTimer('comboRating'..count, crochet * 0.001)

	-- Modified combo text code made by Stilic

	if getProperty('combo') > 9 then
        -- lot of vars but shut up i know we need these
	count = count + 1
        local tag = 'combo' .. count
        local offset = {0,0} --getPropertyFromClass('ClientPrefs', 'comboOffset')

        -- pixel style is great too
        makeLuaSprite(tag, pixelShitPart1 .. 'combo' .. pixelShitPart2, screenWidth * 0.55 + 45, 0)
        scaleObject(tag, scaleShit, scaleShit)
        updateHitbox(tag)

        -- i wanted to put that after ratio var but psych don't let me do that
        screenCenter(tag, 'y')
	setProperty(tag .. '.y', getProperty(tag..'.y') + 35)

        -- my brain told me to fix the offsets as fast as i can

        -- box2d based??? dik
        setProperty(tag .. '.acceleration.y', 600)
        setProperty(tag .. '.velocity.y', getProperty(tag .. '.velocity.y') - 150)
	setProperty(tag .. '.velocity.x', getProperty(tag .. '.velocity.x') - math.random(1,10))

        setProperty(tag .. '.antialiasing', antialiasing)
        addLuaSprite(tag, true)

        -- fuck psych doesn't support startDelay so i use a timer instead
        runTimer(tag, crochet * 0.001)
	end

	-- k this part was made by me
	
	local combo = getProperty('combo')
	local seperatedScore = {}

	if combo >= 1000 then
		table.insert(seperatedScore, math.floor(combo / 1000) % 10)
	end
	table.insert(seperatedScore, math.floor(combo / 100) % 10)
	table.insert(seperatedScore, math.floor(combo / 10) % 10)
	table.insert(seperatedScore, combo % 10)

	for number,i in pairs(seperatedScore) do

		count = count + 1
		makeLuaSprite('comboNum'..count,  pixelShitPart1 .. 'num'..i .. pixelShitPart2, 0, 0)
		screenCenter('comboNum'..count)
		setProperty('comboNum'..count..'.x', screenWidth * 0.55 + (43 * (number-1)) - 90)
		setProperty('comboNum'..count..'.y', getProperty('comboNum'..count..'.y') + 80)

		if not pixel then
			setGraphicSize('comboNum'..count, getProperty('comboNum'..count..'.width') * 0.5)
		else
			setGraphicSize('comboNum'..count, getProperty('comboNum'..count..'.width') * getPropertyFromClass('PlayState', 'daPixelZoom'))
		end
		updateHitbox('comboNum'..count)
		setProperty('comboNum'..count..'.antialiasing', antialiasing)
		
		addLuaSprite('comboNum'..count, true)

		setProperty('comboNum'..count..'.acceleration.y', math.random(200, 300))
		setProperty('comboNum'..count..'.velocity.y', getProperty('comboNum'..count..'.velocity.y') - math.random(140, 160))
		setProperty('comboNum'..count..'.velocity.x', math.random() + math.random(-5, 5))
		runTimer('comboNum'..count, crochet * 0.002)

	end
    end
end

function noteMiss(...)
	setTextString('score', 'Score: '.. getProperty('songScore'))
end

function onDestroy()
	if getProperty('cpuControlled') then
		setPropertyFromClass('ClientPrefs', 'cpuControlled', true)
	end

	if isUsingGhost then setPropertyFromClass('ClientPrefs', 'ghostTapping', true) end
	if not hudHidden then setPropertyFromClass('ClientPrefs', 'hideHud', false) end
end

function onTimerCompleted(tag)
    if tag:starts('combo') then
        doTweenAlpha(tag, tag, 0, 0.2, 'linear')
    end
end

function onTweenCompleted(tag)
    if tag:starts('combo') then
        removeLuaSprite(tag, true)
    end
end

function popUpScore(note)
	-- i'll maybe do something with this in future updates
end

function judgeNote(noteTime)
	local timingWindows = {
		getPropertyFromClass('ClientPrefs', 'sickWindow'),
		getPropertyFromClass('ClientPrefs', 'goodWindow'),
		getPropertyFromClass('ClientPrefs', 'badWindow')
	}

	local windowNames = {'sick', 'good', 'bad'}

	for thing=1, #timingWindows do
		if noteTime <= timingWindows[thing] then
			return windowNames[thing]
		end
	end
	return 'shit'
end