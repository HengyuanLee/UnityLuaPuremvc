PureMVC.MacroCommand = class('PureMVC.MacroCommand')
local module = PureMVC.MacroCommand
module.subcommands = {}--<string,[]func>

function module:ctor()
    self:InitializeMacroCommand()
end

function module:InitializeMacroCommand()
end

function module:AddSubCommand(commandFunc)
    table.insert(self.subcommands, commandFunc)
end

function module:Execute(notification)
    while #self.subcommands > 0 do
        --总是先执行最先放入的
        local commandFunc = table.remove(self.subcommands, 1)
        local command = commandFunc()
        command:Execute(notification)
    end
end