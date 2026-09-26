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
	doTweenAlpha('fadeout', 'fade', 0, 30, 'linear')
end
