PlayerInfoPanel = class('PlayerInfoPanel')
PlayerInfoPanel.NAME = 'PlayerInfoPanel'
local module = PlayerInfoPanel

function module:ctor(panelName)
    self.panelName = panelName
    self:Load(panelName)
end

function module:Load(panelName)
    self.gameObject = CS.ResourcesLoader.Instance:LoadPanel(panelName)
    self.transform = self.gameObject.transform
    self.gameObject:SetActive(false)
    self.text = self.transform:Find('Text'):GetComponent(typeof(CS.UnityEngine.UI.Text))
end
function module:Show()
    self.gameObject:SetActive(true)
end
function module:Hide()
    self.gameObject:SetActive(false)
end