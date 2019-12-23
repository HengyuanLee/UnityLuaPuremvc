PureMVC.Facade = class('PureMVC.Facade')
local module = PureMVC.Facade

module.controller = nil
module.model = nil
module.view = nil

local instance = nil

function module:GetInstance()
    if instance == nil then
        instance = self.new('PureMVC.Facade')
    end
    return instance
end

function module:ctor()
    self:InitializeFacade()
end

function  module:InitializeFacade()
    self.model = PureMVC.Core.Model.new(self.multitionKey)
    self.view = PureMVC.Core.View.new(self.multitionKey)
    self.controller = PureMVC.Core.Controller.new(self.multitionKey)
end

function module:RegisterCommand(notificationName, commandFunc)
    self.controller:RegisterCommand(notificationName, commandFunc)
end

function module:RemoveCommand(notificationName)
    self.controller:RemoveCommand(notificationName)
end

function module:HasCommand()
    return self.controller:HasCommand()
end

function module:RegisterProxy(proxy)
    self.model:RegisterProxy(proxy)
end

function module:RetrieveProxy(proxyName)
    return self.model:RetrieveProxy(proxyName)
end

function module:RemoveProxy(proxyName)
    return self.model:RemoveProxy(proxyName)
end

function module:HasProxy(proxyName)
    return self.model:HasProxy(proxyName)
end

function module:RegisterMediator(mediator)
    self.view:RegisterMediator(mediator)
end
function module:RetrieveMediator(mediatorName)
    return self.view:RetrieveMediator(mediatorName)
end

function module:RemoveMediator(mediatorName)
    return self.view:RemoveMediator(mediatorName)
end

function module:HasMediator(mediatorName)
    return self.view:HasMediator(mediatorName)
end
function module:NotifyObservers(notification)
    self.view:NotifyObservers(notification)
end

function module:SendNotification(notificationName, body, type)
    local notification = PureMVC.Notification.new(notificationName, body, type)
    self:NotifyObservers(notification)
end