PureMVC.Observer = class('PureMVC.Observer')
local module = PureMVC.Observer

function module:ctor(notifyMethod, notifyContext)
    self.NotifyMethod = notifyMethod
    self.NotifyContext = notifyContext
    assert(self.NotifyMethod)
    assert(self.NotifyContext)
end


function module:NotifyObserver(notification)
    return self.NotifyMethod(notification)
end

function module:CompareNotifyContext(obj)
    return self.notifyContext == obj
end