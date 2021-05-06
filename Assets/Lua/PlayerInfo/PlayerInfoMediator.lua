PlayerInfoMediator = class('PlayerInfoMediator', PureMVC.Mediator)
local module = PlayerInfoMediator

function module:ctor(mediatorName, View)
    module.super.ctor(self, mediatorName, View)
    self.View = View
end

function module:ListNotificationInterests()
    return {
        Network.CMD_LOGIN_SUCCESS,
        PlayerInfoProxy.CMD_REFRESH
    }
end
function module:HandleNotification(notification)
    if notification.Name == Network.CMD_LOGIN_SUCCESS then
        --登录成功时显示玩家信息
        self.View:Show()
    elseif notification.Name == PlayerInfoProxy.CMD_REFRESH then
        --PlayerInfoProxy的数据刷新时，重新填充显示的玩家数据
        local proxy = AppFacade:GetInstance():RetrieveProxy(PlayerInfoPanel.NAME)
        local data = proxy:GetData()
        if data ~= nil then
            local info = string.format(
                " 登录成功！\n 玩家信息 \n id: %d\n 昵称：%s\n 公会：%s \n 等级：%d \n vip：%d \n hp：%s \n mp：%d",
                data.id, 
                data.nickname, 
                data.guildName, 
                data.level, 
                data.vip,
                data.hp,
                data.mp)
            self.View.text.text = info
        end
    end
end
