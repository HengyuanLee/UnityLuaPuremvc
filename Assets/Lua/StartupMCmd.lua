require 'Login/LoginInitCmd'
require 'PlayerInfo/PlayerInfoInitCmd'

StartupMCmd = class('StartupMCmd', PureMVC.MacroCommand)

--这个类以MCmd后缀结尾是一个MacroCommand，
--内部添加了多个子Cmd，按添加顺序执行，
--宏Cmd一次性使用，执行完之后子Cmd就会被清空。
function StartupMCmd:InitializeMacroCommand()
    --添加2个UI系统模块的初始化Cmd
    self:AddSubCommand(function() return LoginInitCmd.new() end)
    self:AddSubCommand(function() return PlayerInfoInitCmd.new() end)
end