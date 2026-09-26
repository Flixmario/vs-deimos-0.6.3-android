function onEvent(name, value1, value2)
    if name == 'madtruck-engineer' then
		-- debugPrint('who the fuck');
		makeAnimatedLuaSprite('madtruckengineer', 'madtruckengineer',-2600,-140);
		addAnimationByPrefix('madtruckengineer', 'boom', 'madtruckengineer', 18, false);
		addLuaSprite('madtruckengineer', false);
    	scaleObject('madtruckengineer', 2, 2);

		setProperty('madtruckengineer.alpha', 1);
		objectPlayAnimation('madtruckengineer', 'boom', false);
	end
end
