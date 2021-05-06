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
    --在这里我是始终返回false
    --print(obj.__cname,self.NotifyContext.__cname)
    --尼玛我排查了半天，作者你把NotifyContext写成了notifyContext，大小写写错了
    --这个框架问题还比较多
    return self.NotifyContext == obj
end