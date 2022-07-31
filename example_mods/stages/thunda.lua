function onCreate()
	makeLuaSprite('sky', 'thunda/sky', -1204, -456);
	setLuaSpriteScrollFactor('sky', 0.15, 0.15);
	addLuaSprite('sky', false);
	
	makeLuaSprite('clouds', 'thunda/clouds', -988, -260);
	setLuaSpriteScrollFactor('clouds', 0.25, 0.25);
	addLuaSprite('clouds', false);
	
	makeLuaSprite('backmount', 'thunda/backmount', -700, -40);
	setLuaSpriteScrollFactor('backmount', 0.4, 0.4);
	addLuaSprite('backmount', false);
	
	makeLuaSprite('middlemount', 'thunda/middlemount', -240, 200);
	setLuaSpriteScrollFactor('middlemount', 0.6, 0.6);
	addLuaSprite('middlemount', false);
	
	makeLuaSprite('ground', 'thunda/ground', -660, 624);
	addLuaSprite('ground', false);
end