function onCountdownTick(counter)
	if counter == 3 then
        --very cool go animation
        makeAnimatedLuaSprite('go', 'goAnim', 380, 150);
        addAnimationByPrefix('go', 'idle', 'GO!!', 24, false)
        setObjectCamera('go', 'other')
        addLuaSprite('go', true);
        objectPlayAnimation('go', 'idle', false)
        objectPlayAnimation('gf', 'cheer', false)
        objectPlayAnimation('boyfriend', 'hey', false)
    end
end