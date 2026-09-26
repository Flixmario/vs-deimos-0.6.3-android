function onCreate()
makeLuaSprite('city', 'city', -9785370.7,-780);
	setLuaSpriteScrollFactor('city', 0.1, 0.1);
    scaleObject('city', 1.1, 1.1);

    runTimer('city',2.0)
    end
	function onTimerCompleted(t,l,ll)
	if t == 'city' then
    doTweenX('city.x','city',-4400,3)
	runTimer('0.6')
	end
	if t == 'city' then
	setProperty('city.x',-1080)
	runTimer('city',2.9)
	end

    
    addLuaSprite('city', false);
	setObjectOrder('city', 0);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end