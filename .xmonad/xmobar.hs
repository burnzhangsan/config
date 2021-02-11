Config
{ font = "xft:Noto Sans:size=9,Noto Sans CJK SC DemiLight:size=9, Noto Sans CJK JP DemiLight:size=9"
	, bgColor = "#222222"
		, fgColor = "#ffffff"
		, alpha = 64
		, position = Bottom
		, lowerOnStart = True
		, allDesktops = True
		, overrideRedirect = True
		, pickBroadest = False
		, commands =
		[ Run Cpu
		[ "-t", "CPU: <total>%"
			, "-L", "30"
				, "-H", "60"
				, "-l", "#CEFFAC"
				, "-n", "#FFFFCC"
				, "-h", "#FFB6B0"
		] 10
		, Run Memory
		[ "-t", "MEM: <usedratio>%"
		, "-L", "30"
			, "-H", "80"
			, "-l", "#CEFFAC"
			, "-n", "#FFFFCC"
			, "-h", "#FFB6B0"
		] 20
		, Run DynNetwork
		[ "-t", "NET: <rx>, <tx>"
		, "-L", "10"
			, "-H", "200"
			, "-l", "#CEFFAC"
			, "-n", "#FFFFCC"
			, "-h", "#FFB6B0"
		] 10
		, Run Battery
		[ "-t", "BAT: <acstatus>(<left>%)"
		, "-L", "10"
			, "-H", "80"
			, "-l", "lightred"
			, "-n", "lightorange"
			, "-h", "lightgreen"
		] 100
		, Run Date
		"<fc=#ababab>%F (%a) %T</fc>" "date" 10
		, Run MPD
		["-t"
		, "<statei>: <artist> - <title>"
		] 10
		, Run UnsafeStdinReader
		]
		, sepChar = "%",
		, alignSep = "}{",
		, template = "%UnsafeStdinReader%}{%mpd% |%cpu% |%memory% |%dynnetwork% |%battery% |%date%"
}
