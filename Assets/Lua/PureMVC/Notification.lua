PureMVC.Notification = class('PureMVC.Notification')
local module = PureMVC.Notification

function module:ctor(notificationName, body, type)
    assert(notificationName)
    self.Name = notificationName
    self.Body = body
    self.Type = type
end