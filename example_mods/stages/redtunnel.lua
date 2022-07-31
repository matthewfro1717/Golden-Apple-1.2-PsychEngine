function onCreate()
	-- background shit
	makeLuaSprite('redtunnel', 'redtunnel', -1500, -900);
	setLuaSpriteScrollFactor('redtunnel', 0, 0);
	scaleObject('redtunnel', 2, 2)
	addLuaSprite('redtunnel', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end