function onEvent(name, value1, value2)
    if name == 'hanktruck' then
		-- debugPrint('who the fuck');
		makeAnimatedLuaSprite('hanktruck', 'hanktruck',-4140,-90);
		addAnimationByPrefix('hanktruck', 'hanktruck', 'hanktruck', 18, false);
		addLuaSprite('hanktruck', false);
    	scaleObject('hanktruck', 2, 2);

		setProperty('hanktruck.alpha', 1);
		objectPlayAnimation('hanktruck', 'hanktruck', false);
	end
end
