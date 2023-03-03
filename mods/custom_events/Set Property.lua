function onEvent(tag,v1,v2)
	if tag == 'Set Property' then
		setProperty(v1, v2)
	end
end