
PureMVC.Core.View = class('PureMVC.Core.View')
local module = PureMVC.Core.View

local instance = nil
module.mediatorMap = {}--==<string, mediator>
module.observerMap = {}--==<string, table{observer}>

function module:ctor()
    self:InitializeView()
end

function module:GetInstance()
    if instance == nil then
        instance = self.new('PureMVC.View')
    end
    return instance
end
function  module:InitializeView()
end


function module:RegisterObserver(notificationName, observer)
    assert(iskindof(observer,'PureMVC.Observer'))
    self.observerMap[notificationName] = self.observerMap[notificationName] or {}
    table.insert(self.observerMap[notificationName], observer)
end


function module:NotifyObservers(notification)
    assert(iskindof(notification, 'PureMVC.Notification'))
    local observers = self.observerMap[notification.Name]
    if observers ~= nil then
        for _, observer in pairs(observers) do
            observer:NotifyObserver(notification)
        end
    else
        error('没有监听的命令 '..notification.Name)
    end
end
--这个移除机制里看，只移除一个就break，所以同一个view表(实例)里只应该注册一个观察者
function module:RemoveObserver(notificationName, notifyContext)
    local observers = self.observerMap[notificationName]
    if observers ~= nil then
        for k, observer in pairs(observers) do
            if observer:CompareNotifyContext(notifyContext) == true then
                table.remove(self.observerMap[notificationName], k)
                break
            end
        end
    end
end

function module:RegisterMediator(mediator)
    assert(iskindof(mediator, 'PureMVC.Mediator'))
    assert(mediator.MediatorName)
    if self.mediatorMap[mediator.MediatorName] ~= nil then
        error('已经注册过的mediator：'..mediator.MediatorName)
        return
    end
    self.mediatorMap[mediator.MediatorName] = mediator
    local interests = mediator:ListNotificationInterests()
    if #interests > 0 then
        local args = {
            NotifyMethod = function(notification)
                mediator:HandleNotification(notification)
            end,
            NotifyContext = mediator
        }
       local observer = PureMVC.Observer.new(args.NotifyMethod, args.NotifyContext)
       for _, notificationName in pairs(interests) do
           self:RegisterObserver(notificationName, observer)
       end 
    end
    mediator:OnRegister()
end

function module:RetrieveMediator(mediatorName)
    return self.mediatorMap[mediatorName]
end

function module:RemoveMediator(mediatorName)
    local mediator = self.mediatorMap[mediatorName]
    if mediator ~= nil then
        local interests = mediator.ListNotificationInterests()
        for _,notificationName in pairs(interests) do
            self:RemoveObserver(notificationName, mediator)
            --这里如果报错是作者写的Mediator类中OnRemove的名字写错了，去Mediator中修改
            mediator:OnRemove()
        end
    end
    --作者没有将mediatorName从map中移除
    self.mediatorMap[mediatorName] = nil
end

function module:HasMediator(mediatorName)
    if self.mediatorMap[mediatorName] ~= nil then
        return true
    else
        return false
    end
end