function onEvent(name, value1, value2)
    if name == 'grunt2' then
		-- debugPrint('who the fuck');
		makeAnimatedLuaSprite('grunt2', 'cargrunt2',-930,40);
		addAnimationByPrefix('grunt2', 'boom', 'd', 18, false);
		addLuaSprite('grunt2', false);
    	scaleObject('grunt2', 1, 1);

		setProperty('grunt2.alpha', 1);
		objectPlayAnimation('grunt2', 'boom', false);
	end
end
