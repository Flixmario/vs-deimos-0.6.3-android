function onCreate()

    precacheImage('cargrunt1');
    precacheImage('cargrunt2');
    precacheImage('madtruckengineer');
	precacheImage('madtruck');
	precacheImage('tricky dies');
	precacheImage('rock');
	precacheImage('hanktruck');
	precacheImage('extruck');
	precacheImage('redfog');

	makeLuaSprite('bg2', 'bg2', -5370.7,-380);
	setLuaSpriteScrollFactor('bg2', 0.1, 0.1);

	makeAnimatedLuaSprite ('tricky', 'tricky',-100.7,-1400) addAnimationByPrefix ('tricky', 'tricky', 'tricky', 24, true)
    objectPlayAnimation ('tricky', 'tricky', false)
    setScrollFactor ('tricky', 3.0, 3.0);
	scaleObject('tricky', 0.8, 0.8);

	makeAnimatedLuaSprite ('tricky dies', 'tricky dies',-3200.7,-900) addAnimationByPrefix ('tricky dies', 'tricky dies', 'tricky dies', 24, true)
    objectPlayAnimation ('tricky dies', 'tricky dies', false)
    setScrollFactor ('tricky dies', 0.0, 0.0);
	scaleObject('tricky dies', 1.8, 1.8);

	makeLuaSprite('effects', 'effects', -1200,-1018);
	setLuaSpriteScrollFactor('effects', 0.1, 0.1);

	makeLuaSprite('redfog', 'redfog', -1200,-1018);
	setLuaSpriteScrollFactor('redfog', 0.1, 0.1);

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

	addLuaSprite('tricky', false);
	addLuaSprite('bg2', false);
	setObjectOrder('tricky', 0);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

