
require 'PureMVC/PureMVC'
require 'StartupMCmd'
require 'AppFacade'
require 'Network'

--游戏lua入口函数
function Main()
    print('start Main ...')
    AppFacade:GetInstance():Startup()
end