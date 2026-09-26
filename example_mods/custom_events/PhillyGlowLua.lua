--[[
	Philly Glow Lua Script (v0.6.1+)
	Raltyro's #4 HScript Usage in Psych Lua
	by Raltyro (6/5/2022)
	(LAST MODIFIED 8/28/2022)
	
	This script replicates how philly glow but in lua
	can be used in another stages!!
	
	You can remove this credits this if your a fucker for me i won't give a shit
	fuck me if you want.
--]]

local inPhilly = false

function onCreate()
	if (not compareVersion(getVersion(), "0.6.1")) then
		debugPrint("The version you're currently using is not supported for PhillyGlowLua!")
		debugPrint("The required version to use this are v0.6.2 and above")
		return close(false)
	end
	if (getVersionNumber(getVersion()) == 061) then
		debugPrint("The version you're currently using is unstable!")
		debugPrint("Please use the version v0.6.2 and above")
	end
	
	-- LMAO DONT RUN THE SCRIPT TWICE!!
	for i = 0, getProperty("luaArray.length") - 1 do
		local scriptName = getPropertyFromGroup("luaArray", i, "scriptName"):reverse()
		scriptName = scriptName:sub(1, scriptName:find("/", 1, true) - 1):reverse()
		
		if (scriptName:lower() == "phillyglowlua.lua") then
			return close(false)
		end
	end
	
	initPhillyGlow()
end

function initPhillyGlow()
	inPhilly = type(getProperty("phillyStreet.x")) == "number"
	
	addHaxeLibrary("BGSprite")
	addHaxeLibrary("Std")
	addHaxeLibrary("Type")
	
	runHaxeCode([[
		inPhilly = ]] .. (inPhilly and "true" or "false") .. [[;
		FlxTypedGroup = Type.getClass(game.strumLineNotes);
		FlxTypedSpriteGroup = Type.getClass(game.gfGroup);
		
		// crash prevention
		if (inPhilly)
			defaultPhillyLightsColors = game.phillyLightsColors;
		else {
			defaultPhillyLightsColors = [0xFF31A2FD, 0xFF31FD8C, 0xFFFB33F5, 0xFFFD4531, 0xFFFBA633];
			game.phillyLightsColors = defaultPhillyLightsColors;
			
			game.phillyWindow = new BGSprite('go', 0, 0, 0, 0);
			game.add(game.phillyWindow);
			
			game.phillyStreet = new BGSprite('go', 0, 0);
			game.add(game.phillyStreet);
		}
		
		game.eventPushed({
			strumTime: 0,
			event: "Philly Glow",
			value1: "0",
			value2: "0"
		});
		game.eventPushedMap.remove("Philly Glow");
		
		if (!inPhilly) {
			game.remove(game.phillyWindow);
			game.remove(game.phillyStreet);
			
			game.phillyWindow.kill(); game.phillyWindow.destroy();
			//game.phillyStreet.kill(); game.phillyStreet.destroy();
			
			game.remove(game.blammedLightsBlack);
			game.insert(game.members.indexOf(game.gfGroup) - 2, game.blammedLightsBlack);
			
			game.phillyGlowGradient.originalHeight += 500;
			game.phillyGlowGradient.originalY = game.gf.y + 150;
			game.phillyGlowGradient.scrollFactor.set(0, .5);
			
			game.triggerEventNote("Philly Glow", "2", "0");
			PhillyGlowParticle = Type.getClass(game.phillyGlowParticles.members[0]);
		}
		
		setColorPhillyGlow = function(color, darkColor) {
			if (inPhilly) {
				if (game.phillyTrain != null) game.phillyTrain.color = darkColor;
				return;
			}
			
			for (v in game.members) {
				if (
					v != game.phillyGlowGradient && v != game.phillyGlowParticles && v != game.dadGroup &&
					v != game.boyfriendGroup && v != game.gfGroup && v != game.strumLineNotes &&
					v != game.opponentStrums && v != game.playerStrums && v != game.grpNoteSplashes &&
					v != game.notes && v != game.strumLine
				) {
					if (Std.isOfType(v, FlxSprite)) {
						if (v.camera == game.camGame) v.color = darkColor;
					}
					else if (Std.isOfType(v, FlxTypedGroup)) {
						if (v.camera == game.camGame) {
							for (v2 in v) {
								if (Std.isOfType(v2, FlxSprite) && v2.camera == game.camGame)
									v2.color = darkColor;
							}
						}
					}
				}
			}
		}
	]])
end

local reqs = {
	turns = 0,
	on = false,
	color = nil,
	spawnPars = 0
}
local status = {
	turns = 0,
	on = false,
	color = nil,
	spawnPars = 0
}

function onEvent(n, v1, v2)
	if (inGameOver) then return end
	n = n:lower() or ""
	v1 = tostring(v1) or ""
	v2 = tostring(v2) or ""
	
	if (n == "phillyglowlua") then
		local s, empty = false, v2 == "" or v2 == " "
		local ogV2 = v2
		
		v1 = tonumber(v1)
		
		local r, g, b
		if (v1 == 1 or v1 == 2 or v1 == 3) then
			v2 = ogV2:startsWith("0x") and ogV2:sub(3) or ogV2
			s, r, g, b = pcall(from_hex, 3, "0x" .. v2:sub(#v2 - 5, #v2))
			if (not s or (not r or not g or not b)) then
				v2 = nil if (not empty) then debugPrint("PhillyGlowLua Error! Value2 \"" .. ogV2 .. "\" cannot be setted") end
			else
				v2 = to_num(3, r, g, b)
			end
		end
		
		if (v1 == 0) then
			reqs.on = false
			reqs.turns = reqs.turns + 1
		elseif (v1 == 1) then -- turn on
			reqs.on = true
			reqs.turns = reqs.turns + 1
			reqs.color = v2
		elseif (v1 == 2) then -- spawn particles
			if (reqs.on and v2 ~= nil and reqs.color ~= v2) then
				reqs.turns = reqs.turns + 1
				reqs.color = v2
			end
			reqs.spawnPars = reqs.spawnPars + 1
		elseif (v1 == 3) then
			reqs.on = true
			reqs.turns = reqs.turns + 1
			reqs.color = v2
			reqs.spawnPars = reqs.spawnPars + 1
		end
	end
end

function ev0()
	runHaxeCode([[
		game.triggerEventNote("Philly Glow", "0", "");
		setColorPhillyGlow(0xFFFFFFFF, 0xFFFFFFFF);
	]])
end

function ev1()
	runHaxeCode([[
		game.phillyLightsColors = ]] .. (reqs.color and ("[%s]"):format(tostring(reqs.color)) or "defaultPhillyLightsColors") .. [[;
		if (game.phillyLightsColors.length <= 1) game.curLightEvent = -1;
		
		game.triggerEventNote("Philly Glow", "1", "0");
		var color = game.phillyGlowGradient.color;
		var darkColor = game.phillyStreet.color;
		
		setColorPhillyGlow(color, darkColor);
		game.phillyWindowEvent.visible = false;
		game.blammedLightsBlack.alpha = .5;
		game.remove(game.phillyWindowEvent);
	]])
end

function ev2()
	runHaxeCode([[
		if (inPhilly) {
			game.triggerEventNote("Philly Glow", "2", "0");
			return;
		}
		
		if(!ClientPrefs.lowQuality) {
			var particlesNum = FlxG.random.int(8, 12);
			var width = (4000 / particlesNum);
			var color = game.phillyLightsColors[game.curLightEvent];
			for (j in 0...6) {
				for (i in 0...particlesNum) {
					var particle:PhillyGlowParticle = new PhillyGlowParticle(
						-1200 + width * i + FlxG.random.float(-width / 5, width / 5),
						game.phillyGlowGradient.originalY + (FlxG.random.float(0, 125) + j * 40) + 265,
						color
					);
					game.phillyGlowParticles.add(particle);
				}
			}
		}
		
		game.phillyGlowGradient.bop();
	]])
end

function onUpdate()
	if (reqs.turns ~= status.turns) then
		if (reqs.on) then
			ev1()
		else
			ev0()
		end
	end
	
	if (reqs.spawnPars ~= status.spawnPars) then
		ev2()
	end
	
	for i, v in next, reqs do status[i] = v end
end

function onUpdatePost()
	runHaxeCode([[
		game.phillyGlowGradient.scale.x = 10000;
		game.phillyGlowGradient.x = (FlxG.width - game.phillyGlowGradient.width) / 2;
	]])
end

function string.startsWith(self, prefix) return self:find(prefix, 1, true) == 1 end

local function from_hex(hexes, hex)
	local v = {string.match(hex, "^0x?" .. string.duplicate("(%w%w)", hexes or 3) .. "$")}
	for i in next, v do v[i] = tonumber(v[i], 16) end
    return unpack(v)
end

local function to_num(hexes, ...)
	return tonumber("0x" .. string.format(string.duplicate("%02X", hexes or 3), ...))
end







-- version checker
version3rdStrumlineRalt = 1

function getVersion()
	return version or getPropertyFromClass("MainMenuState", "psychEngineVersion") or "0.0.0"
end

function getVersionLetter(ver) -- ex "0.5.2h" > "h"
	local str = ""
	string.gsub(ver, "%a+", function(e)
		str = str .. e
	end)
	return str
end

function getVersionNumber(ver) -- ex "0.6.1" > 61
	local str = ""
	string.gsub(ver, "%d+", function(e)
		str = str .. e
	end)
	return tonumber(str)
end

function getVersionBase(ver) -- ex "0.5.2h" > "0.5.2"
	local letter, str = getVersionLetter(ver), ""
	if (letter == "") then return ver end
	for s in ver:gmatch("([^"..letter.."]+)") do
		str = str .. s
	end
	return str
end

function compareVersion(ver, needed)
	local a, b = getVersionLetter(ver), getVersionLetter(needed)
	local c, d = getVersionNumber(ver), getVersionNumber(needed)
	local v = true
	if (c == d) then v = (b == "" or (a ~= "" and a:byte() >= b:byte())) end
	return c >= d and v
end
