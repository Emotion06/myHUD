fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'
lua54 'yes'

author 'Emotion'
description 'HUD Script'

server_scripts {
    'server/*.lua'
}

client_scripts {
    'client/*.lua',
}

shared_scripts {
    'shared/*.lua'
}

ui_page {
    'ui/index.html'
}

files {
    'ui/img/*',
    'ui/css/*.css',
    'ui/index.html',
    'ui/fonts/*',
    'ui/js/*.js'
}

escrow_ignore {
	'shared/*.lua',
}