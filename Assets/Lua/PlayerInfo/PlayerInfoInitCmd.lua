require 'PlayerInfo/PlayerInfoPanel'
require 'PlayerInfo/PlayerInfoMediator'
require 'PlayerInfo/PlayerInfoProxy'

PlayerInfoInitCmd = class('PlayerInfoInitCmd', PureMVC.SimpleCommand)
local module = PlayerInfoInitCmd

--PlayerInfo系统模块初始化，包括mediator和proxy。
function module:Execute(notification)
    local panel = PlayerInfoPanel.new(PlayerInfoPanel.NAME)
    local mediator = PlayerInfoMediator.new(PlayerInfoPanel.NAME, panel)
    local proxy = PlayerInfoProxy.new(PlayerInfoPanel.NAME)
    AppFacade:GetInstance():RegisterMediator(mediator)
    AppFacade:GetInstance():RegisterProxy(proxy)
end