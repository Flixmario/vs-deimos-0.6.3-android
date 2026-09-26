function onEvent(name, value1, value2)
    if name == 'grunt1-2' then
		-- debugPrint('who the fuck');
		makeAnimatedLuaSprite('grunt1-2', 'cargrunt1',-1280, 250);
		addAnimationByPrefix('grunt1-2', 'boom', 'd', 18, false);
		addLuaSprite('grunt1-2', true);
    	scaleObject('grunt1-2', 1, 1);

		setProperty('grunt1-2.alpha', 1);
		objectPlayAnimation('grunt1-2', 'boom', true);
	end
end
