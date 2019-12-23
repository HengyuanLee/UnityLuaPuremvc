
AppFacade = class('AppFacade',PureMVC.Facade)
AppFacade.APP_STARTUP = 'APP_STARTUP'
local module = AppFacade

--ctor等同于class的构造方法，在new()时会被调用。
function module:ctor()
    self.super:ctor()
    --注册启动命令StartupMCmd,这是个宏命令。
    --注册为一个函数原因是实现命令的无状态性，需要时才被实例化出来，省内存。
    self:RegisterCommand(AppFacade.APP_STARTUP, function() return StartupMCmd.new() end)
end

--发出启动游戏命令。
function module:Startup()
    self:SendNotification(AppFacade.APP_STARTUP)
end
