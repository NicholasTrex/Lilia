﻿------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local PANEL = {}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function PANEL:Init()
    self:SetTitle(L("thirdpersonConfig"))
    self:SetSize(300, 140)
    self:Center()
    self:MakePopup()
    self.list = self:Add("DPanel")
    self.list:Dock(FILL)
    self.list:DockMargin(0, 0, 0, 0)
    local cfg = self.list:Add("DNumSlider")
    cfg:Dock(TOP)
    cfg:SetText("") -- Set the text above the slider
    cfg:SetMin(0) -- Set the minimum number you can slide to
    cfg:SetMax(30) -- Set the maximum number you can slide to
    cfg:SetDecimals(0) -- Decimal places - zero for whole number
    cfg:SetConVar("lia_tp_vertical") -- Changes the ConVar when you slide
    cfg:DockMargin(10, 0, 0, 5)
    local cfg = self.list:Add("DNumSlider")
    cfg:Dock(TOP)
    cfg:SetText("") -- Set the text above the slider
    cfg:SetMin(-30) -- Set the minimum number you can slide to
    cfg:SetMax(30) -- Set the maximum number you can slide to
    cfg:SetDecimals(0) -- Decimal places - zero for whole number
    cfg:SetConVar("lia_tp_") -- Changes the ConVar when you slide
    cfg:DockMargin(10, 0, 0, 5)
    local cfg = self.list:Add("DNumSlider")
    cfg:Dock(TOP)
    cfg:SetText("ance") -- Set the text above the slider
    cfg:SetMin(0) -- Set the minimum number you can slide to
    cfg:SetMax(100) -- Set the maximum number you can slide to
    cfg:SetDecimals(0) -- Decimal places - zero for whole number
    cfg:SetConVar("lia_tp_ance") -- Changes the ConVar when you slide
    cfg:DockMargin(10, 0, 0, 5)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
vgui.Register("liaTPConfig", PANEL, "DFrame")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------