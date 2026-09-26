-- gf icon script by Misha21220 [GD] (artycity21), dont delete this please
function onCreate()

        if getPropertyFromClass('ClientPrefs', 'hideHUD', false) then
		else if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('gficon-b', 'icons/gfidle-b', 535, 535)
                else
		makeLuaSprite('gficon-b', 'icons/gfidle-b', 535, -10)
                makeLuaSprite('thing', 635, 10)
                end
                setObjectCamera('gficon-b', 'hud')
                scaleObject('gficon-b', 1.2, 1.2)
                setProperty('gficon-b.visible', true)
                addLuaSprite('gficon-b', true)

		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('gfsad-b', 'icons/gfsad-b', 535, 535)
                else
		makeLuaSprite('gfsad-b', 'icons/gfsad-b', 535, -10)
                makeLuaSprite('thing', 535, -10)
                end
                setObjectCamera('gfsad-b', 'hud')
                scaleObject('gfsad-b', 1.2, 1.2)
                setProperty('gfsad-b.visible', false)
                addLuaSprite('gfsad-b', true)

		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('gfsmile-b', 'icons/gfsmile-b', 535, 535)
                else
		makeLuaSprite('gfsmile-b', 'icons/gfsmile-b', 535, -10)
                end
                setObjectCamera('gfsmile-b', 'hud')
                scaleObject('gfsmile-b', 1.2, 1.2)
                setProperty('gfsmile-b.visible', false)
                addLuaSprite('gfsmile-b', true)
       end
end

function onUpdate()
	if getProperty('healthBar.percent') > 100 then
                setProperty('gfsad-b.flipX', true)
                setProperty('thing.flipX', true)
                setProperty('gfsmile-b.flipX', true)
                setProperty('gficon-b.flipX', false)
                setProperty('healthbar', false)
        else
                setProperty('gfsad-b.flipX', false)
                setProperty('gfsmile-b.flipX', false)
                setProperty('gficon-b.flipX', false)
        end

	if getProperty('healthBar.percent') > 80 then
	setProperty('gfsmile-b.scale.x', getProperty('iconP1.scale.x'))
	setProperty('gfsmile-b.scale.y', getProperty('iconP1.scale.y'))
	setProperty('gfsmile-b.alpha', getProperty('healthBar.alpha'))
		setProperty('gfsad-b.visible', false)
		setProperty('gfsmile-b.visible', true)
		setProperty('gficon-b.visible', false)
        else if getProperty('healthBar.percent') < 25 then
	setProperty('gfsad-b.scale.x', getProperty('iconP1.scale.x'))
	setProperty('gfsad-b.scale.y', getProperty('iconP1.scale.y'))
	setProperty('gfsad-b.alpha', getProperty('healthBar.alpha'))
		setProperty('gfsmile-b.visible', false)
		setProperty('gfsad-b.visible', true)
		setProperty('gficon-b.visible', false)
        else
		setProperty('gfsad-b.visible', false)
		setProperty('gfsmile-b.visible', false)
		setProperty('gficon-b.visible', true)
        end
        end

	setProperty('gficon-b.scale.x', getProperty('iconP1.scale.x'))
	setProperty('gficon-b.scale.y', getProperty('iconP1.scale.y'))
	setProperty('gficon-b.alpha', getProperty('healthBar.alpha'))
end --this script is old, i mean this script is first what i made