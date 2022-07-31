function onCountdownStarted()

    for i=0,3 do

        setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets_3D')

    end

    for i = 0, getProperty('unspawnNotes.length')-1 do

        if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then

            setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets_3D');

        end

    end

end

--This works in Psych Engine 0.5.1, I'm not sure if it works in any other version
--put the note skin image and xml in mods/images, and change the name of 'your note skin' to what you named your note skin
--THIS ONLY WORKS IN data/your-song-name !! IT DOESN'T WORK IN mods/scripts !! JUST A LITTLE WARNING!!