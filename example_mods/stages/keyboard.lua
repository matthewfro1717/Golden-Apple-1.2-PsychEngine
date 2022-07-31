function onCreate()
	-- background shit
	makeLuaSprite('keyboard', 'ocs/keyboard', -500, -150);
	setScrollFactor('keyboard', 0.9, 0.9);
	addGlitchEffect('keyboard', 2, 5, 0.1)
	addLuaSprite('keyboard',false)
end