PureMVC.Mediator = class('PureMVC.Mediator', PureMVC.Notifier)
local module = PureMVC.Mediator

module.MediatorName = nil
module.View = nil

function module:ctor(mediatorName, view)
    assert(mediatorName)
    assert(view)
    self.MediatorName = mediatorName
    self.View = view
end

function module:ListNotificationInterests()
    return {}
end
function module:HandleNotification(notification)
end
function module:OnRegister()
end
function module:OnRemove()
end