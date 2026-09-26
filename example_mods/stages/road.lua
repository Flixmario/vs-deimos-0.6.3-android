function onCreate()

    precacheImage('cargrunt1');
    precacheImage('cargrunt2');
    precacheImage('madtruckengineer');
	precacheImage('rock');
	precacheImage('madtruck');
	precacheImage('extruck');
	precacheImage('redfog');
	precacheImage('hanktruck');

	makeLuaSprite('bg2', 'bg2', -5370.7,-380);
	setLuaSpriteScrollFactor('bg2', 0.1, 0.1);

	makeAnimatedLuaSprite ('city', 'city',-4500.7,-1100) addAnimationByPrefix ('city', 'city', 'city', 20, true)
    objectPlayAnimation ('city', 'city', false)
    setScrollFactor ('city', 0.1, 0.1);
	scaleObject('city', 9.1, 9.1);

	setProperty('cameraSpeed', 0.5) 
	
	runTimer('bg2',0.1)
    end
	function onTimerCompleted(t,l,ll)
	if t == 'bg2' then
    doTweenX('bg2.x','bg2',-5400,2)
	runTimer('0.6')
	end
	if t == 'bg2' then
	setProperty('bg2.x',-1000)
	runTimer('bg2',1.8)
	end

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
	end
	addLuaSprite('redfog', false);
	addLuaSprite('bg2', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

