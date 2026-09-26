-- gf icon script by Misha21220 [GD] (artycity21), dont delete this please
function onCreate()

        if getPropertyFromClass('ClientPrefs', 'hideHUD', false) then
		else if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('gficon-h', 'icons/gfidle-h', 535, 535)
                else
		makeLuaSprite('gficon-h', 'icons/gfidle-h', 535, -10)
                makeLuaSprite('thing', 635, 10)
                end
                setObjectCamera('gficon-h', 'hud')
                scaleObject('gficon-h', 1.2, 1.2)
                setProperty('gficon-h.visible', true)
                addLuaSprite('gficon-h', true)

		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('gfsad-h', 'icons/gfsad-h', 535, 535)
                else
		makeLuaSprite('gfsad-h', 'icons/gfsad-h', 535, -10)
                makeLuaSprite('thing', 535, -10)
                end
                setObjectCamera('gfsad-h', 'hud')
                scaleObject('gfsad-h', 1.2, 1.2)
                setProperty('gfsad-h.visible', false)
                addLuaSprite('gfsad-h', true)

		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('gfsmile-h', 'icons/gfsmile-h', 535, 535)
                else
		makeLuaSprite('gfsmile-h', 'icons/gfsmile-h', 535, -10)
                end
                setObjectCamera('gfsmile-h', 'hud')
                scaleObject('gfsmile-h', 1.2, 1.2)
                setProperty('gfsmile-h.visible', false)
                addLuaSprite('gfsmile-h', true)
       end
end

function onUpdate()
	if getProperty('healthBar.percent') > 100 then
                setProperty('gfsad-h.flipX', true)
                setProperty('thing.flipX', true)
                setProperty('gfsmile-h.flipX', true)
                setProperty('gficon-h.flipX', false)
                setProperty('healthbar', false)
        else
                setProperty('gfsad-h.flipX', false)
                setProperty('gfsmile-h.flipX', false)
                setProperty('gficon-h.flipX', false)
        end

	if getProperty('healthBar.percent') > 80 then
	setProperty('gfsmile-h.scale.x', getProperty('iconP1.scale.x'))
	setProperty('gfsmile-h.scale.y', getProperty('iconP1.scale.y'))
	setProperty('gfsmile-h.alpha', getProperty('healthBar.alpha'))
		setProperty('gfsad-h.visible', false)
		setProperty('gfsmile-h.visible', true)
		setProperty('gficon-h.visible', false)
        else if getProperty('healthBar.percent') < 25 then
	setProperty('gfsad-h.scale.x', getProperty('iconP1.scale.x'))
	setProperty('gfsad-h.scale.y', getProperty('iconP1.scale.y'))
	setProperty('gfsad-h.alpha', getProperty('healthBar.alpha'))
		setProperty('gfsmile-h.visible', false)
		setProperty('gfsad-h.visible', true)
		setProperty('gficon-h.visible', false)
        else
		setProperty('gfsad-h.visible', false)
		setProperty('gfsmile-h.visible', false)
		setProperty('gficon-h.visible', true)
        end
        end

	setProperty('gficon-h.scale.x', getProperty('iconP1.scale.x'))
	setProperty('gficon-h.scale.y', getProperty('iconP1.scale.y'))
	setProperty('gficon-h.alpha', getProperty('healthBar.alpha'))
end --this script is old, i mean this script is first what i made