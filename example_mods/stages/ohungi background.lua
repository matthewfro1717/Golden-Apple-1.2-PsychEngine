cx = 0;
cy = 0;

function onCreate()
    local hx = 3148 / 2;
    local hy = 1664 / 2;
    cx = -400 + hx;
    cy = -500 + hy;

    makeLuaSprite('background', 'ohungi skybox', cx, cy)
    --addGlitchEffect('background', 2.2)
    setProperty('background.offset.x', hx);
    setProperty('background.offset.y', hy);
    setProperty('background.antialiasing', true);
    setProperty('background.alpha', 0.25);

    makeLuaSprite('rbg', 'ohungi skybox', cx, cy)
    setProperty('rbg.offset.x', hx);
    setProperty('rbg.offset.y', hy);
    setProperty('rbg.antialiasing', true);

    addLuaSprite('rbg', false) 
    addLuaSprite('background', false) 
    makeLuaSprite('frontground', 'ohungi ground', -800, 264.75)
    addLuaSprite('frontground', false)

    makeLuaSprite('over', 'over', 0, 0)
    setProperty('over.scale.x', 100);
    setProperty('over.scale.y', 100);
    setProperty('over.alpha', 0.2);
    --setBlendMode('over', 'darken');
    setScrollFactor('over', 0, 0)
    addLuaSprite('over', true)
end
fr = 0
function onUpdate(elapsed)
    fr = fr + elapsed;

    setProperty('background.scale.x', (1 + math.cos(fr) / 4) * 1)
    setProperty('background.scale.y', (1 + math.cos(fr + 1) / 4) * 1)

    setProperty('rbg.scale.x', 1 + math.cos(fr*3) / 6)
    setProperty('rbg.scale.y', 1 + math.cos(fr*3 + 2) / 6)
    setProperty('rbg.angle', math.sin(fr*3) * 8);
    setProperty('rbg.x', cx + math.sin(fr*3) * 200);
    setProperty('rbg.y', cy + math.cos(fr*3) * 200);
end
