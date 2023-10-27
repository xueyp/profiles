if has("win32")
	let g:XkbSwitchLib = 'C:\Dev\nvim-win64\bin\libxkbswitch64.dll'
else
	let g:XkbSwitchLib = '/usr/local/lib/libxkbswitch.so'
endif

let g:XkbSwitchEnabled     = 1
let g:XkbSwitchIMappings   = ['cn']
let g:XkbSwitchIMappingsTr = {'cn': {'<': '', '>': ''}}

