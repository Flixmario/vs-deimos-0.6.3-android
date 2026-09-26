function onEvent(name, value1, value2)
    if name == 'tricky dies' then
		-- debugPrint('who the fuck');
		makeAnimatedLuaSprite('tricky dies', 'tricky dies',-2880,-1280);
		addAnimationByPrefix('tricky dies', 'boom', 'tricky dies', 18, false);
		addLuaSprite('tricky dies', false);
    	scaleObject('tricky dies', 2, 2);

		setProperty('tricky dies.alpha', 1);
		objectPlayAnimation('tricky dies', 'boom', true);
	end
end
