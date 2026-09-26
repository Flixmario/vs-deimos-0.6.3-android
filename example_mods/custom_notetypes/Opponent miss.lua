function onCreate()

    --Iterate over all notes

    for i = 0, getProperty('unspawnNotes.length')-1 do

        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Opponent miss' then --Check if the note on the chart is a Bullet Note
            setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true) --Miss has no penalties

            setPropertyFromGroup('unspawnNotes', i, 'texture', '') --Change texture

            setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', '')

            setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0)

            setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20)

            setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1)

            setPropertyFromGroup('unspawnNotes', i, 'hitByOpponent', false)

        end

    end

end
