function onCreate()
	makeLuaSprite('back 1', 'trix/alge_back', -1475, -775);
	setLuaSpriteScrollFactor('back 1', 0, 0);
	addLuaSprite('back 1', false)
	
	makeLuaSprite('mid 1', 'trix/alge_mid', -300, -600);
	addLuaSprite('mid 1', false)
	
	makeLuaSprite('front 1', 'trix/alge_front', -300, -845);
	addLuaSprite('front 1', false)
	
	makeLuaSprite('back 2', 'trix/butch_back', -1475, -775);
	setLuaSpriteScrollFactor('back 2', 0, 0);
	setProperty('back 2.visible', false)
	addLuaSprite('back 2', false)
	
	makeLuaSprite('mid 2', 'trix/butch_mid', -300, -600);
	setProperty('mid 2.visible', false)
	addLuaSprite('mid 2', false)
	
	makeLuaSprite('front 2', 'trix/butch_front', -300, -845);
	setProperty('front 2.visible', false)
	addLuaSprite('front 2', false)
	
	makeLuaSprite('back 3', 'trix/bad_back', -1475, -775);
	setLuaSpriteScrollFactor('back 3', 0, 0);
	setProperty('back 3.visible', false)
	addLuaSprite('back 3', false)
	
	makeLuaSprite('mid 3', 'trix/bad_mid', -300, -600);
	setProperty('mid 3.visible', false)
	addLuaSprite('mid 3', false)
	
	makeLuaSprite('front 3', 'trix/bad_front', -300, -845);
	setProperty('front 3.visible', false)
	addLuaSprite('front 3', false)
end

function onSongStart()
	doTweenColor('darkbf', 'boyfriend', '949494', 1, 'linear')
	doTweenColor('darkbamb', 'dad', '949494', 1, 'linear')
	doTweenColor('darkgf', 'gf', '949494', 1, 'linear')
end

function onEvent(name, value1, value2)
      if name == 'Change BG 1' then
                    setProperty('back 2.visible', true)
                    setProperty('mid 2.visible', true)
                    setProperty('front 2.visible', true)
      end
      if name == 'Change BG 2' then
                    setProperty('back 3.visible', true)
                    setProperty('mid 3.visible', true)
                    setProperty('front 3.visible', true)
end
end