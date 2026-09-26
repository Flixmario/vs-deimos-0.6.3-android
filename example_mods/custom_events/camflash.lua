local amstupid = 0;

function onEvent(name, value1, value2)

    if name == 'camflash' then
		cameraFlash('game', 'ffffff', 0.31, true);
		setObjectOrder('camflash', 2);
		setProperty('picobreakdanceshootin.alpha', 1);
		runTimer('picostopshootin2', 0.2, 1);
		if getProperty('picobreakdance.visible') == false then
			triggerEvent('picoshoot', amstupid, 0);
		end
	end

	if name == 'cantthinkrightnow' then
		amstupid = value1;
	end
end

function onTimerCompleted(tag)
	if tag == 'picostopshootin2' then
		setProperty('picobreakdanceshootin.alpha', 0);
	end
end
