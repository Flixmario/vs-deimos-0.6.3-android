function onEvent(name, value1, value2)
    if name == 'grunt1' then
		-- debugPrint('who the fuck');
		makeAnimatedLuaSprite('grunt1', 'cargrunt1',-1280, 250);
		addAnimationByPrefix('grunt1', 'boom', 'd', 18, false);
		addLuaSprite('grunt1', true);
    	scaleObject('grunt1', 1, 1);

		setProperty('grunt1.alpha', 1);
		objectPlayAnimation('grunt1', 'boom', true);
	end
end
