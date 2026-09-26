function onCreatePost()
    setProperty('timeBarBG.visible', false)
    setProperty('timeBar.visible', false)
end

function onSongStart()
    setProperty('timeBarBG.visible', false)
    setProperty('timeBar.visible', false)
end
function onUpdate()
    doTweenColor('TimerColor', 'timeBar', 'FF1100', '0.1', 'linear')
end