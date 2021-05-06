LoginSuccessCmd = class('LoginSuccessCmd', PureMVC.SimpleCommand)
local module = LoginSuccessCmd

--有这个类的存在，只是为了更新PlayerInfoProxy的数据，
--因为proxy和mediator不一样，数据模型proxy为了解耦不接收任何通知，
--但UI mediator需要作为观察者接收通知与用户进行互动。
function module:Execute(notification)
    local gameInfoProxy = AppFacade:GetInstance():RetrieveProxy(PlayerInfoPanel.NAME)
    gameInfoProxy:Refresh(notification.Body)
end
