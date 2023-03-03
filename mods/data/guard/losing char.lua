function onCreatePost()
	dad = 'guardian'
	dadLose = 'guardian-lose'
	addCharacterToList(dadLose, dad)
	bf = 'green-pl'
	bfLose = 'green-pl-lose'
	addCharacterToList(bfLose, bf)
end

function onUpdate()
	health = getProperty('health')

	if health > 1.6 then
	   triggerEvent('Change Character', 'dad', dadLose)
	elseif health < 1.6 and health > 0.4 then
	   triggerEvent('Change Character', 'dad', dad)
	   triggerEvent('Change Character', 'bf', bf)
	elseif health < 0.4 then
	   triggerEvent('Change Character', 'bf', bfLose)
	end
end

function onEvent(name, v1, v2)
	if name == 'ass' then
		if v1 == 'changeBF' then
			bfChars = {v2}
			bf = bfChars[1]
			bfLose = bfChars[2]
		end
		if v1 == 'changeDAD' then
			dadChars = {v2}
			dad = dadChars[1]
			dadLose = dadChars[2]
		end
	end
end