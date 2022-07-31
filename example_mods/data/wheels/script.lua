local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and inGameOver and not seenCutscene then --Block the first countdown
		setProperty('inCutscene', true);
		startVideo('death');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end