PureMVC.Core.Model = class('PureMVC.Core.Model')
local module = PureMVC.Core.Model

local instance = nil
module.proxyMap = {}

function module:ctor()
    self:InitializeModel()
end

function module:GetInstance()
    if instance == nil then
        instance = self.new()
    end
    return instance
end

function  module:InitializeModel()
end



function module:RegisterProxy(proxy)
    assert(iskindof(proxy, 'PureMVC.Proxy'))
    assert(type(proxy.ProxyName)=='string')
    self.proxyMap[proxy.ProxyName] = proxy
    proxy:OnRegister()
end

function module:RetrieveProxy(ProxyName)
    return self.proxyMap[ProxyName]
end

function module:RemoveProxy(proxyName)
    for k,proxy in pairs(self.proxyMap) do
        if k == proxyName then
            table.remove(self.proxyMap, k)
            proxy:OnRemove()
            return proxy
        end
    end
end

function module:HasProxy(proxyName)
    if self.proxyMap[proxyName] ~= nil then
        return true
    else
        return false
    end
end