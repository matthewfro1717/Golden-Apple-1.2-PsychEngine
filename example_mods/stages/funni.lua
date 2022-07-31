function onCreate()
	-- background shit
	makeLuaSprite('nature', 'nature', -1500, -900);
	setLuaSpriteScrollFactor('nature', 0, 0);
	scaleObject('nature', 2, 2)
	addLuaSprite('nature', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end