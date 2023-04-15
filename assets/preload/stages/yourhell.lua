local followchars = true
local xx = 900
local yy = 925
local xx2 = 900
local yy2 = 925
local ofs = 25
local del = 0
local del2 = 0

luaDebugMode = true


function onCreate()
	setProperty('skipCountdown', true)
	setProperty('camHUD.alpha', 0)

	setPropertyFromClass('GameOverSubstate', 'characterName', 'kolt-intro')

    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'loldied'); --file goes inside sounds/ folder
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameoverRom'); --file goes inside music/ folder
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameoverLoopEnd'); --file goes inside music/ folder
	
	--aids
	addCharacterToList('Kolt', 'bf')
	addCharacterToList('Burning', 'dad')
	addCharacterToList('ROMline1', 'dad')
	addCharacterToList('ROMline2', 'dad')

	precacheImage('yourhell/walls')
	precacheImage('yourhell/beanbag')
	precacheImage('yourhell/saturn')
	precacheImage('yourhell/table')
	precacheImage('yourhell/computer')
	precacheImage('yourhell/floor')
	precacheImage('yourhell/smallfire')
	precacheImage('yourhell/largefire')

	makeLuaSprite('blackFuckBG', 'yourhell/black', -1000, 0)
	scaleObject('blackFuckBG', 3, 3)	

	makeLuaSprite('blackFuck', 'yourhell/black', 0, -500)
	scaleObject('blackFuck', 3, 3)	

	makeLuaSprite('platform', 'yourhell/platform', 410, 1150)
	scaleObject('platform', 1.1, 1.1)

	addLuaSprite ('platform', false)
	addLuaSprite('blackFuck', true) -- i am so fucking stupid dawg... or not.

	makeLuaSprite('bartop','',0,-40)
    makeGraphic('bartop',1280,100,'000000')
    setObjectCamera('bartop','hud')
    setScrollFactor('bartop',0,0)

    makeLuaSprite('bartopbot','',0,650)
    makeGraphic('bartopbot',1280,110,'000000')
    setScrollFactor('bartopbot',0,0)
    setObjectCamera('bartopbot','hud')

	addLuaSprite('bartop',true)
	addLuaSprite('bartopbot',true)

end

function onUpdate(elapsed)
	if followchars == true then
		if mustHitSection == false then
		  if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
			triggerEvent('Camera Follow Pos',xx-ofs,yy)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
			triggerEvent('Camera Follow Pos',xx+ofs,yy)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'singUP' then
			triggerEvent('Camera Follow Pos',xx,yy-ofs)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
			triggerEvent('Camera Follow Pos',xx,yy+ofs)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
			triggerEvent('Camera Follow Pos',xx-ofs,yy)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
			triggerEvent('Camera Follow Pos',xx+ofs,yy)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
			triggerEvent('Camera Follow Pos',xx,yy-ofs)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
			triggerEvent('Camera Follow Pos',xx,yy+ofs)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
			triggerEvent('Camera Follow Pos',xx,yy)
		  end
		  if getProperty('dad.animation.curAnim.name') == 'idle' then
			triggerEvent('Camera Follow Pos',xx,yy)
		  end
		else
		  if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
			triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
		  end
		  if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
			triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
		  end
		  if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
			triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
		  end
		  if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
			triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
		  end
		  if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
			triggerEvent('Camera Follow Pos',xx2,yy2)
		  end
		  if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
			triggerEvent('Camera Follow Pos',xx2,yy2)
		  end
		end
	else
		triggerEvent('Camera Follow Pos','','')
	end
end

function onStepHit()
	if curStep == 33 then
		doTweenAlpha('removeBlackFuck', 'blackFuck', 0, 5, 'easeInOut')
	end
	if curStep == 96 then
		doTweenAlpha('revealTheFuckingCamera', 'camHUD', 1, 3, 'easeInOut')
	end
	if curStep == 192 then
		cameraFlash('camGame', 'ff9100', 2);
		setProperty('defaultCamZoom', 0.75)
	end
	if curStep == 864 then
		cameraFlash('camGame', 'ff9100', 2);
		xx = 700
		yy = 500
		xx2 = 1000
		yy2 = 500
	end
	if curStep == 768 then
		doTweenAlpha('revealTheFuckingCamera2', 'camHUD', 0, 1.5, 'easeInOut')
		setProperty('defaultCamZoom', 0.9)
	end
	if curStep == 864 then
		removeLuaSprite('blackFuckBG', true)
		cameraFlash('camGame', 'ff9100', 1);
		doTweenAlpha('revealTheFuckingCamera3', 'camHUD', 1, 0.5, 'easeInOut')
		
		setProperty('defaultCamZoom', 0.65)
		
		makeLuaSprite('wall', 'yourhell/walls', -523.8, -740)
		makeLuaSprite('beanbag', 'yourhell/beanbag', 1085.2, 320.5)
		makeLuaSprite('saturn', 'yourhell/saturn', 459.75, 449.2)
		makeLuaSprite('table', 'yourhell/table', -213.3, 308.1)
		makeLuaSprite('pc', 'yourhell/computer', -113.65, -12.05)
		makeLuaSprite('floor', 'yourhell/floor', -604.95, 338.15)
		-- anim shit makes me want to kill myself

		makeAnimatedLuaSprite('smallfire', 'yourhell/smallfire', -43.55, -291)
		addAnimationByPrefix('smallfire', 'smallfire', 'smallfire', 24, true)
		playAnim('smallfire', 'smallfire', false, false, 0)

		makeAnimatedLuaSprite('largefire', 'yourhell/largefire', -600, -650)
		addAnimationByPrefix('largefire', 'largefire', 'largefire', 24, true)
		setProperty('largefire.alpha', 0.4)
		playAnim('largefire', 'largefire', false, false, 0)

		addLuaSprite('floor', false)
		addLuaSprite('wall', false)
		addLuaSprite('beanbag', false)
		addLuaSprite('saturn', false)
		addLuaSprite('table', false)
		addLuaSprite('pc', false)
		addLuaSprite('smallfire', false)
		addLuaSprite('largefire', true)

	end
	if curStep == 1056 then
		cameraFlash('camGame', 'ff9100', 1);
		setProperty('defaultCamZoom', 0.8)
	end
	if curStep == 1248 then
		cameraFlash('camGame', 'ff9100', 1.5);
		setProperty('defaultCamZoom', 0.8)

		makeLuaSprite('vignette', 'yourhell/vignette', 0, 0)
		setScrollFactor('vignette',0,0)
		setObjectCamera('vignette','hud')
		addLuaSprite('vignette', true)
	end
	if curStep == 1440 then
		cameraFlash('camGame', 'ff9100', 1);
		setProperty('defaultCamZoom', 0.7)
	end
	if curStep == 1632 then
		cameraFlash('camGame', 'ff9100', 1);
		setProperty('defaultCamZoom', 0.65)
		removeLuaSprite("vignette", true)
	end
	if curStep == 1824 then
		cameraFlash('camGame', 'ff9100', 2);
		removeLuaSprite("largefire", true)
		doTweenAlpha('readdBlackFuck', 'blackFuck', 1, 0.1, 'easeInOut')
		doTweenAlpha('revealTheFuckingCamera4', 'camHUD', 0, 0.5, 'easeInOut')
	end

	function onGameOverStart()
			playMusic("gameoverRom", 1, true)
	end

	function onGameOverConfirm()
		playSound("gameoverLoopEnd", 1, "")
	end

end