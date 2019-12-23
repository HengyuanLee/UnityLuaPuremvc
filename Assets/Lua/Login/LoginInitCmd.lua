require 'Login/LoginPanel'
require 'Login/LoginMediator'
require 'Login/LoginClickCmd'

LoginInitCmd = class('LoginInitCmd', PureMVC.SimpleCommand)

--Login功能模块初始化cmd，
--这里是有view 的Mediator实例化，model的Proxy参考PlayerInfo系统模块
function LoginInitCmd:Execute(notification)
    local panel = LoginPanel.new(LoginPanel.NAME)
    local mediator = LoginMediator.new(LoginPanel.NAME, panel)
    AppFacade:GetInstance():RegisterMediator(mediator)
    AppFacade:GetInstance():RegisterCommand(LoginClickCmd.CMD, function () return LoginClickCmd.new() end)
end