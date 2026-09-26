function onEvent(name, value1, value2)
    if name == 'rock' then
		-- debugPrint('who the fuck');
		makeAnimatedLuaSprite('rock', 'rock',-6000, -40);
		addAnimationByPrefix('rock', 'boom', 'rock', 18, false);
		addLuaSprite('rock', true);
    	scaleObject('rock', 1.4, 1.4);

		setProperty('rock.alpha', 1);
		objectPlayAnimation('rock', 'boom', true);
	end
end
