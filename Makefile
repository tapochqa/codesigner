SHELL = /bin/zsh
SIGN = /usr/bin/codesign --force --deep --sign -
XATTR-CR = /usr/bin/xattr -cr
CHM = /bin/chmod +x


PATH = /Library/Audio/Plug-Ins

sign:
	${SIGN} $(package)

xattr-cr:
	${XATTR-CR} $(package)

chm:
	${CHM} $(package)

trinity: sign xattr-cr chm

trinity-component: 
	/usr/bin/make trinity package="${PATH}/Components/$(plugin).component"

trinity-vst: 
	/usr/bin/make trinity package="${PATH}/VST/$(plugin).vst"

trinity-vst3: 
	/usr/bin/make trinity package="${PATH}/VST3/$(plugin).vst3"

trinity-plugin: 
	/usr/bin/make trinity-component trinity-vst trinity-vst3
