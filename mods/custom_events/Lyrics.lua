function onCreate()
	makeLuaText('lyricsU', '', 600, 340, 550)
	setTextSize('lyricsU', '26')
	setProperty('lyricsU.alpha', 0.35)
	setTextAlignment('lyricsU', 'center')
	setTextFont('lyricsU', 'hell.ttf')
	addLuaText('lyricsU')

	makeLuaText('lyricsREAL', '', 600, 340, 570)
	setTextSize('lyricsREAL', '24')
	setTextAlignment('lyricsREAL', 'center')
	addLuaText('lyricsREAL')

	makeLuaText('lyrics', '', 600, 340, 550)
	setTextSize('lyrics', '26')
	setTextAlignment('lyrics', 'center')
	setTextFont('lyrics', 'hell.ttf')
	addLuaText('lyrics')
end

function onEvent(name, value1, value2)
	if name == 'Lyrics' then
		setTextColor('lyrics', 'FFFFFF')
		setTextColor('lyricsU', 'FFFFFF')
		setTextColor('lyricsREAL', 'FFFFFF')
		if curStep >= 575 and curStep <= 608 or curStep >= 959 and curStep <= 993 or curStep >= 1087 and curStep <= 1121 then
			setTextColor('lyrics', 'FF0000')
			setTextColor('lyricsU', 'FF0000')
			setTextColor('lyricsREAL', 'FF0000')
		end
		setProperty('lyrics.alpha', 1)
		setProperty('lyricsREAL.alpha', 0.35)--0.35
		setProperty('lyricsU.alpha', 0)--0.35
		setTextString('lyrics', value1)
		setTextString('lyricsREAL', value1)
		setTextString('lyricsU', value2)
	end
end