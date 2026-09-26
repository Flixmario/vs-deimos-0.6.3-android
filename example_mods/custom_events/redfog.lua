function onEvent(name, value1, value2)
    if name == 'redfog' then
		-- debugPrint('who the fuck');
		makeAnimatedLuaSprite('redfog', 'redfog',-1250, -1250);
		addAnimationByPrefix('redfog', 'boom', 'redfog', 18, false);
		addLuaSprite('redfog', true);
    	scaleObject('redfog', 6, 6);

		setProperty('redfog.alpha', 1);
		objectPlayAnimation('redfog', 'boom', true);
	end
end
