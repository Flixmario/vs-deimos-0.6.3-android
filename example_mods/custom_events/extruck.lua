function onEvent(name, value1, value2)
    if name == 'extruck' then
		-- debugPrint('who the fuck');
		makeAnimatedLuaSprite('extruck', 'extruck',-2400,-1110);
		addAnimationByPrefix('extruck', 'boom', 'extruck', 18, false);
		addLuaSprite('extruck', false);
    	scaleObject('extruck', 2, 2);

		setProperty('extruck.alpha', 1);
		objectPlayAnimation('extruck', 'boom', false);
	end
end
