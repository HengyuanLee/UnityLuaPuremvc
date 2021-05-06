PureMVC.Notifier = class('PureMVC.Notifier')
local module = PureMVC.Notifier

function module:SendNotification(notificationName, body, type)
    PureMVC.Facade.GetInstance():SendNotification(notificationName, body, type)
end