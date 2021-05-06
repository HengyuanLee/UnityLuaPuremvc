--用于对LoginPanel的各种操作，事件处理，数据填充等。
--PureMVC.Mediator同时继承了Notifier类，所以能够SendNotification
--PureMVC.Mediator实现了观察者功能，提供ListNotificationInterests()方法来填写感兴趣的Cmd，并在HandleNotification()回调。
--这说明了Mediator其实也是一个Cmd，以观察者模式集成了Cmd的功能。
LoginMediator = class('LoginMediator', PureMVC.Mediator)
local module = LoginMediator

function module:ctor(mediatorName, view)
    --覆盖了父类的构造方法，显示调用父类构造方法，
    --和其它语言有点不同，lua语法特性和class的定义决定了这样写
    module.super.ctor(self, mediatorName, view)
    self:init()
end
function module:init()
    self.View:Show()
    self.View.btnLogin.onClick:AddListener(
        function()
           self:onLoginClick() 
        end
    )
end
--点击登录事件
function module:onLoginClick()
    if self.View.inputUsername == nil then
        print(debug.traceback())
        print(self.View.__cname)
    end
    local username = self.View.inputUsername.text
    local password = self.View.inputPassword.text
    local body = {
        username = username,
        password = password
    }
    self:SendNotification(LoginClickCmd.CMD, body)
end
--指定方法ListNotificationInterests()中填写感兴趣的Cmd
function module:ListNotificationInterests()
    return {
        Network.CMD_LOGIN_SUCCESS
    }
end
--感兴趣的Cmd 在HandleNotification(notification)中收到回调
function module:HandleNotification(notification)
    if notification.Name == Network.CMD_LOGIN_SUCCESS then
        self.View:Hide()
    end
end