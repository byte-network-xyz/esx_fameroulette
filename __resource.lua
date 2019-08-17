client_script 'client.lua' --your NUI Lua File
server_script "@mysql-async/lib/MySQL.lua"
server_script 'server.lua'
ui_page('html/index.html') --THIS IS IMPORTENT

--[[The following is for the files which are need for you UI (like, pictures, the HTML file, css and so on) ]]--
files {
    'html/index.html',
    'html/soundeffect.mp3',
    'html/less/style.less',
    'html/js/index.js',
    'html/img/lose.mp3',
    'html/img/spin.mp3',
    'html/img/win.mp3',
    'html/img/audioOn.png',
    'html/img/audioOff.png',
    'html/css/style.css'
}
