
PureMVC.Core.Controller = class('PureMVC.Core.Controller')
local module = PureMVC.Core.Controller
module.view = nil

local instance = nil
module.commandMap = {}--<string, Command>

function module:ctor()
    self:InitializeController()
end

function module:GetInstance()
    if instance == nil then
        instance = self.new('PureMVC.Controller')
    end
    return instance
end

function  module:InitializeController()
    self.view = PureMVC.Core.View:GetInstance()
end

function module:ExecuteCommand(notification)
    assert(notification.__cname=='PureMVC.Notification')
    local commandFunc = self.commandMap[notification.Name]
    if commandFunc ~= nil then
        local command = commandFunc()
        command:Execute(notification)
    end
end

function module:RegisterCommand(notificationName, commandFunc)
    assert(type(commandFunc)=='function')
    assert(type(notificationName) == 'string')
    assert(self.commandMap[notificationName]==nil,
        '已存在的notificationName:'..
        notificationName..
        ' 一个命令只能注册一个SimpleCommand，注册多个请用MacroCommand'
    )
    local notifyMethod = function(notification)
                            self:ExecuteCommand(notification) 
                        end
    local notifyContext = self
    local observer = PureMVC.Observer.new(notifyMethod, notifyContext)
    self.view:RegisterObserver(notificationName, observer)
    self.commandMap[notificationName] = commandFunc
end


function module:RemoveCommand(notificationName)
    for k,commandFunc in pairs(self.commandMap) do
        if k == notificationName then
            table.remove(self.commandMap, k)
            self.view:RemoveObserver(notificationName, self)
        end
    end
end

function module:HasCommand(notificationName)
    if self.commandMap[notificationName] ~= nil then
        return true
    else
        return false
    end
end