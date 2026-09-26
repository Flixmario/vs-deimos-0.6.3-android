-- fade out
function onCreatePost()
	-- end of "create"
	
	makeLuaSprite('fade', 'Black', -1000, -100)
	   scaleObject('fade', 4, 4)
	addLuaSprite('fade', true)
	setObjectCamera('fade', 'camOther')
end

function onSongStart()
	-- Inst and Vocals start playing, songPosition = 0
	doTweenAlpha('fadeout', 'fade', 0, 10, 'linear')
end

function onStepHit()
if curStep == 1262 then
        doTweenAlpha('fadein', 'fade', 1, 2, 'linear')
end
end

