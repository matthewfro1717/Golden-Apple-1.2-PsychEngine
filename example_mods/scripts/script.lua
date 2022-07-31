
local font = "comic-sans-ms.ttf";

function round(num, dp)
    local mult = 10^(dp or 0);
    return math.floor(num * mult + 0.5)/mult;
end

function onCreatePost()
    
    setProperty('timeBarBG.visible', false);
    setProperty('scoreTxt.visible', false);
    setProperty('timeBar.visible', false);
    setTextFont('timeTxt', font);
	setTextFont('botplayTxt', font);
    setTextFont('introtext', font);
end