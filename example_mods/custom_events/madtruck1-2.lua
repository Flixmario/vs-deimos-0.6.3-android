function onEvent(name, value1, value2)
    if name == 'madtruck1-2' then
		-- debugPrint('who the fuck');
		makeAnimatedLuaSprite('madtruck', 'madtruck',-4140,-90);
		addAnimationByPrefix('madtruck', 'boom', 'madtruck', 18, false);
		addLuaSprite('madtruck', false);
    	scaleObject('madtruck', 2, 2);

		setProperty('madtruck.alpha', 1);
		objectPlayAnimation('madtruck', 'boom', false);
	end
end
