require 'PlayerInfo/LoginSuccessCmd'

--模拟与服务器交互
Network = {}
Network.CMD_LOGIN_SUCCESS = 'CMD_LOGIN_SUCCESS'
local module = Network


AppFacade:GetInstance():RegisterCommand(Network.CMD_LOGIN_SUCCESS, function() return LoginSuccessCmd.new() end)

--登录
function module.Login(username, password)
    if password == nil then
        print(debug.traceback())
    end
    print('请求登陆信息 username: '..username..' password: '..password)
    module.onLoginSuccess()
end
--模拟登陆成功
function module.onLoginSuccess()
    --假设数据
    local data = {
        id = 4634536,
        nickname = '小强',
        guildName = '武当山',
        level = 12,
        vip = 1,
        hp = 100,
        mp = 100
    }
    --获取服务器数据data成功后发出通知
    AppFacade:GetInstance():SendNotification(module.CMD_LOGIN_SUCCESS, data)
end