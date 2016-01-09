bg = new BackgroundLayer
	backgroundColor: "#000000"




scroller = new ScrollComponent
	x: 0
	y: 0
	width: Screen.width
	height: Screen.height

scroller.content.backgroundColor = ""

sqares = new Array
for y in [0...10]
	for i in [0...8]
		square = new Layer
			x: i*310
			y: y*310
			width: 300
			height: 300
			blur: 0
			cornerRadius:150
			backgroundColor: "#00ffff"
			superLayer: scroller.content
		sqares.push square
		
contours = new Array
for y in [0...12]
	for i in [0...10]
		cr = new Layer
			x: i*250
			y: y*250
			width: 100
			height: 100
			blur: 0
			cornerRadius:0
			backgroundColor: ""
			borderColor: "#ffff00"
			borderWidth: 2
			superLayer: scroller.content
		contours.push cr

scroller.content.center()

refreshsquares = () ->
	for sqare in sqares
		baseX = (sqare.midX - scroller.scrollX) - (Screen.width / 2 )
		if baseX < 0
			baseX *= -1
		baseY = (sqare.midY - scroller.scrollY) - (Screen.height / 2 )
		if baseY < 0
			baseY *= -1
		#print base
		sqare.scale = 1- (baseX/600 + baseY/600)
	for cr in contours
		baseX = (cr.midX - scroller.scrollX) - (Screen.width / 2 )
		if baseX < 0
			baseX *= -1
		baseY = (cr.midY - scroller.scrollY) - (Screen.height / 2 )
		if baseY < 0
			baseY *= -1
		#print base
		cr.rotation = 1- (baseX/6 + baseY/6)
		cr.scale = (baseX/600 + baseY/600)

refreshsquares()

scroller.on Events.Move, ->
	refreshsquares()
	#print scroller.scrollX
	
scroller.on Events.ScrollStart, ->
	for sqare in sqares
		sqare.animate
			properties: 
				backgroundColor: "#ffffff"
			curve: "ease-in-out"
			time: 0.3

scroller.on Events.ScrollEnd, ->
	for sqare in sqares
		sqare.animate
			properties: 
				backgroundColor: "#00cccc"
			curve: "ease-in-out"
			time: 0.3