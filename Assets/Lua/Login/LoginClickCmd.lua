LoginClickCmd = class('LoginClickCmd', PureMVC.SimpleCommand)
local module = LoginClickCmd
module.CMD = 'LoginClickCmd'

--处理点击登录界面“登录”按钮的事件，向服务器发送登录消息。
function module:Execute(notification)
    local username = notification.Body.username
    local password = notification.Body.password
    Network.Login(username, password)
end