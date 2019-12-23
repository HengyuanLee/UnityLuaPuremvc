--以Panel为后缀的类名对应Unity 里制作的UI预设
--如这里对应LoginPanel.prefab
--panel类等同于一个view，panel里只提供获取控件的接口，供mediator访问，panel内部不做复杂操作。
LoginPanel = class('LoginPanel')
LoginPanel.NAME = 'LoginPanel'
local module = LoginPanel

module.gameObject = nil
module.transform = nil

module.inputUsername = nil
module.inputPassword = nil
module.btnLogin = nil

function module:ctor(panelName)
    self.panelName = panelName
    self:Load(panelName)
end
--加载unity 里的LoginPanel.prefab预设，
--并且获取组件
function module:Load(panelName)
    self.gameObject = CS.ResourcesLoader.Instance:LoadPanel(panelName)
    self.transform = self.gameObject.transform
    self.gameObject:SetActive(false)
    self.inputUsername = self.transform:Find('InputUsername'):GetComponent(typeof(CS.UnityEngine.UI.InputField))
    self.inputPassword = self.transform:Find('InputPassword'):GetComponent(typeof(CS.UnityEngine.UI.InputField))
    self.btnLogin = self.transform:Find('BtnLogin'):GetComponent(typeof(CS.UnityEngine.UI.Button))
end
function module:Show()
    self.gameObject:SetActive(true)
end
function module:Hide()
    self.gameObject:SetActive(false)
end