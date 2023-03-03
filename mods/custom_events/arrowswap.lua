local movement = 'circInOut'
function onEvent(name, value1, value2)
	if name == 'arrowswap' and value1 == 'a' then
		noteTweenX('dad', 0, defaultOpponentStrumX0, value2, movement)
		noteTweenX('dad1', 1, defaultOpponentStrumX0+110, value2, movement)
		noteTweenX('dad2', 2, defaultOpponentStrumX0+110+110, value2, movement)
		noteTweenX('dad3', 3, defaultOpponentStrumX0+110+110+110, value2, movement)

		noteTweenX('bf4', 4, defaultPlayerStrumX0, value2, movement)
		noteTweenX('bf5', 5, defaultPlayerStrumX0+110, value2, movement)
		noteTweenX('bf6', 6, defaultPlayerStrumX0+110+110, value2, movement)
		noteTweenX('bf7', 7, defaultPlayerStrumX0+110+110+110, value2, movement)

		noteTweenAlpha('dadA', 0, 0.4, value2/2, movement)
		noteTweenAlpha('dad1A', 1, 0.4, value2/2, movement)
		noteTweenAlpha('dad2A', 2, 0.4, value2/2, movement)
		noteTweenAlpha('dad3A', 3, 0.4, value2/2, movement)
	end
	if name == 'arrowswap' and value1 == 'b' then
		noteTweenX('bf', 4, defaultOpponentStrumX0, value2, movement)
		noteTweenX('bf1', 5, defaultOpponentStrumX0+110, value2, movement)
		noteTweenX('bf2', 6, defaultOpponentStrumX0+110+110, value2, movement)
		noteTweenX('bf3', 7, defaultOpponentStrumX0+110+110+110, value2, movement)

		noteTweenX('dad4', 0, defaultPlayerStrumX0, value2, movement)
		noteTweenX('dad5', 1, defaultPlayerStrumX0+110, value2, movement)
		noteTweenX('dad6', 2, defaultPlayerStrumX0+110+110, value2, movement)
		noteTweenX('dad7', 3, defaultPlayerStrumX0+110+110+110, value2, movement)

		noteTweenAlpha('dadA', 0, 0.4, value2/2, movement)
		noteTweenAlpha('dad1A', 1, 0.4, value2/2, movement)
		noteTweenAlpha('dad2A', 2, 0.4, value2/2, movement)
		noteTweenAlpha('dad3A', 3, 0.4, value2/2, movement)
	end
end

function onTweencompleted(tag)
	if tag == 'dad3A' then
		noteTweenAlpha('dadAe', 0, 1, value2/2, movement)
		noteTweenAlpha('dad1Ae', 1, 1, value2/2, movement)
		noteTweenAlpha('dad2Ae', 2, 1, value2/2, movement)
		noteTweenAlpha('dad3Ae', 3, 1, value2/2, movement)
	end
end