function onCreate()
	-- background shit
	makeLuaSprite('library', 'library', -600, -300);
	setScrollFactor('library', 1.0, 1.0);
	makeLuaSprite('table', 'table', -730, -710);
	setScrollFactor('table', 1.2, 1.2);
    scaleObject('library', 0.6, 0.6);
    scaleObject('table', 0.8, 0.8);

	addLuaSprite('library', false);
	addLuaSprite('table', true);
	


	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end