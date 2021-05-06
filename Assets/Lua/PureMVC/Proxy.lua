PureMVC.Proxy = class('PureMVC.Proxy', PureMVC.Notifier)
local module = PureMVC.Proxy

function module:ctor(proxyName, data)
    assert(proxyName)
    self.ProxyName = proxyName
    self.Data = data
end

function module:OnRegister()
end
function module:OnRemove()
end