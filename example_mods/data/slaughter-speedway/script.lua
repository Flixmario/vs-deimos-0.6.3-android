local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		setProperty('inCutscene', true);
		startVideo('cutscene');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end
function IconFilterShit()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-sl')
    if downscroll then
        makeAnimatedLuaSprite('cIcon', 'bfdeimos', 635, 15)
    else
        makeAnimatedLuaSprite('cIcon', 'bfdeimos', 635, 580)
    end
    addAnimationByPrefix('cIcon', 'quiet', 'cesarstill', 1, true)
    addAnimationByPrefix('cIcon', 'shakey', 'shakey', 24, true)
    setObjectCamera('cIcon', 'camHud')
    addLuaSprite('cIcon', true)
    objectPlayAnimation('cIcon', 'quiet', true)
end


