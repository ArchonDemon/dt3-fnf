function onCreatePost()
	bf = getProperty('boyfriend.curCharacter')
	addCharacterToList(bf..'-lose', bf)
end

function onUpdate()
	health = getProperty('health')

	if getProperty('health') < 0.6 then
	   triggerEvent('Change Character', '0', bf..'-lose')
	elseif getProperty('health') > 0.6 then
	   triggerEvent('Change Character', '0', bf)
	end
end