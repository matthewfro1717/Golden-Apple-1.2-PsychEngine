function onCreate()
	makeLuaSprite('doll bg lmao', 'covers/sunshinebg', -600, -450);
	scaleObject('doll bg lmao', 1.35, 1.35);
	addLuaSprite('doll bg lmao', false);
	
	makeLuaSprite('black', 'blackscreen', -600, -300);
	scaleObject('black', 999, 999);
	setProperty('black.visible', false)
	addLuaSprite('black', false);
end

function onEvent(name, value1, value2)
      if name == 'Change BG 1' then
                    setProperty('black.visible', true)
      end
      if name == 'Change BG 2' then
                    setProperty('black.visible', false)
end
end