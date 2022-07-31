function onCreate()
	makeAnimatedLuaSprite('hungles', 'multiple_hungles', -328, -220)
	makeAnimatedLuaSprite('epicfail', 'sad_oingo', -314, -220)
	addAnimationByPrefix('hungles', 'scroll', 'Symbol 2' ,60, true)
	addAnimationByPrefix('epicfail', 'scroll', 'Symbol 2' ,60, true)
	setProperty('hungles.scale.x', 0.8)
	setProperty('hungles.scale.y', 0.8)
	setProperty('hungles.alpha', 0.6)
	setProperty('epicfail.scale.x', 0.8)
	setProperty('epicfail.scale.y', 0.8)
	setProperty('epicfail.alpha', 0.6)
    setScrollFactor('hungles', 0, 0)
	setScrollFactor('epicfail', 0, 0)
    addLuaSprite('hungles', false)
	addLuaSprite('epicfail', false)
	objectPlayAnimation('hungles', 'scroll', true)
	objectPlayAnimation('epicfail', 'scroll', true)
end

function onUpdate(elapsed)
	if getProperty('health') > 1.6 then
		setProperty('hungles.visible', false)
		setProperty('epicfail.visible', true)
	else
		setProperty('hungles.visible', true)
		setProperty('epicfail.visible', false)
	end
end
