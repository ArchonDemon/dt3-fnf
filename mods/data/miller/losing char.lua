function onCreatePost()
	dad = getProperty('dad.curCharacter')
	addCharacterToList(dad..'-lose', dad)
end

function onUpdate()
	health = getProperty('health')

	if getProperty('health') > 1.6 then
	   triggerEvent('Change Character', '1', dad..'-lose')
	elseif getProperty('health') < 1.6 then
	   triggerEvent('Change Character', '1', dad)
	end
end