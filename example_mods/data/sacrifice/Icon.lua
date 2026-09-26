-- gf icon script by Misha21220 [GD] (artycity21), dont delete this please
function onCreate()

        if getPropertyFromClass('ClientPrefs', 'hideHUD', false) then
		else if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('gficon', 'icons/gfidle', 535, 535)
                else
		makeLuaSprite('gficon', 'icons/gfidle', 535, -10)
                makeLuaSprite('thing', 635, 10)
                end
                setObjectCamera('gficon', 'hud')
                scaleObject('gficon', 1.2, 1.2)
                setProperty('gficon.visible', true)
                addLuaSprite('gficon', true)

		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('gfsad', 'icons/gfsad', 535, 535)
                else
		makeLuaSprite('gfsad', 'icons/gfsad', 535, -10)
                makeLuaSprite('thing', 535, -10)
                end
                setObjectCamera('gfsad', 'hud')
                scaleObject('gfsad', 1.2, 1.2)
                setProperty('gfsad.visible', false)
                addLuaSprite('gfsad', true)

		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('gfsmile', 'icons/gfsmile', 535, 535)
                else
		makeLuaSprite('gfsmile', 'icons/gfsmile', 535, -10)
                end
                setObjectCamera('gfsmile', 'hud')
                scaleObject('gfsmile', 1.2, 1.2)
                setProperty('gfsmile.visible', false)
                addLuaSprite('gfsmile', true)
       end
end

function onUpdate()
	if getProperty('healthBar.percent') > 100 then
                setProperty('gfsad.flipX', true)
                setProperty('thing.flipX', true)
                setProperty('gfsmile.flipX', true)
                setProperty('gficon.flipX', false)
                setProperty('healthbar', false)
        else
                setProperty('gfsad.flipX', false)
                setProperty('gfsmile.flipX', false)
                setProperty('gficon.flipX', false)
        end

	if getProperty('healthBar.percent') > 80 then
	setProperty('gfsmile.scale.x', getProperty('iconP1.scale.x'))
	setProperty('gfsmile.scale.y', getProperty('iconP1.scale.y'))
	setProperty('gfsmile.alpha', getProperty('healthBar.alpha'))
		setProperty('gfsad.visible', false)
		setProperty('gfsmile.visible', true)
		setProperty('gficon.visible', false)
        else if getProperty('healthBar.percent') < 25 then
	setProperty('gfsad.scale.x', getProperty('iconP1.scale.x'))
	setProperty('gfsad.scale.y', getProperty('iconP1.scale.y'))
	setProperty('gfsad.alpha', getProperty('healthBar.alpha'))
		setProperty('gfsmile.visible', false)
		setProperty('gfsad.visible', true)
		setProperty('gficon.visible', false)
        else
		setProperty('gfsad.visible', false)
		setProperty('gfsmile.visible', false)
		setProperty('gficon.visible', true)
        end
        end

	setProperty('gficon.scale.x', getProperty('iconP1.scale.x'))
	setProperty('gficon.scale.y', getProperty('iconP1.scale.y'))
	setProperty('gficon.alpha', getProperty('healthBar.alpha'))
end --this script is old, i mean this script is first what i made