﻿local PANEL = {}
function PANEL:Init()
    if IsValid(lia.gui.vendor) then
        lia.gui.vendor.noSendExit = true
        lia.gui.vendor:Remove()
    end

    lia.gui.vendor = self
    self:SetSize(ScrW(), ScrH())
    self:MakePopup()
    self:SetAlpha(0)
    self:AlphaTo(255, 0.2, 0)
    self.buttons = self:Add("DPanel")
    self.buttons:DockMargin(0, 32, 0, 0)
    self.buttons:Dock(TOP)
    self.buttons:SetPaintBackground(false)
    self.buttons:SetTall(36)
    self.leave = self.buttons:Add("DButton")
    self.leave:SetFont("VendorButtonFont")
    self.leave:SetText(L("leave"):upper())
    self.leave:SetTextColor(color_white)
    self.leave:SetContentAlignment(9)
    self.leave:SetExpensiveShadow(2, color_black)
    self.leave.DoClick = function() self:Remove() end
    self.leave:SizeToContents()
    self.leave:SetPaintBackground(false)
    self.leave.Paint = function() end
    self.leave.x = ScrW() * 0.5 - (self.leave:GetWide() * 0.5)
    if LocalPlayer():CanEditVendor() then
        self.editor = self.buttons:Add("DButton")
        self.editor:SetFont("VendorButtonFont")
        self.editor:SetText(L("editor"):upper())
        self.editor:SetTextColor(color_white)
        self.editor:SetContentAlignment(9)
        self.editor:SetExpensiveShadow(2, color_black)
        self.editor.DoClick = function() vgui.Create("VendorEditor"):SetZPos(99) end
        self.editor:SizeToContents()
        self.editor:SetPaintBackground(false)
        self.leave.x = self.leave.x + 16 + self.leave:GetWide() * 0.5
        self.editor.x = ScrW() * 0.5 - 16 - self.editor:GetWide()
        self.editor.Paint = function() end
    end

    self.vendor = self:Add("VendorTrader")
    self.vendor:SetWide(math.max(ScrW() * 0.25, 220))
    self.vendor:SetPos(ScrW() * 0.5 - self.vendor:GetWide() - 64 / 2, 64 + self.leave:GetTall())
    self.vendor:SetTall(ScrH() - self.vendor.y - 64)
    self.vendor:setName(liaVendorEnt:getNetVar("name"))
    self.vendor:setMoney(liaVendorEnt:getMoney())
    self.me = self:Add("VendorTrader")
    self.me:SetSize(self.vendor:GetSize())
    self.me:SetPos(ScrW() * 0.5 + 64 / 2, self.vendor.y)
    self.me:setName(L"you")
    self.me:setMoney(LocalPlayer():getChar():getMoney())
    self:listenForChanges()
    self:liaListenForInventoryChanges(LocalPlayer():getChar():getInv())
    self.items = {
        [self.vendor] = {},
        [self.me] = {}
    }

    self:initializeItems()
end

function PANEL:buyItemFromVendor(itemType)
    net.Start("VendorTrade")
    net.WriteString(itemType)
    net.WriteBool(false)
    net.SendToServer()
end

function PANEL:sellItemToVendor(itemType)
    net.Start("VendorTrade")
    net.WriteString(itemType)
    net.WriteBool(true)
    net.SendToServer()
end

function PANEL:initializeItems()
    for itemType in SortedPairs(liaVendorEnt.items) do
        local mode = liaVendorEnt:getTradeMode(itemType)
        if not mode then continue end
        if mode ~= VENDOR_SELLONLY then self:updateItem(itemType, self.me):setIsSelling(true) end
        if mode ~= VENDOR_BUYONLY then self:updateItem(itemType, self.vendor) end
    end
end

function PANEL:shouldItemBeVisible(itemType, parent)
    local mode = liaVendorEnt:getTradeMode(itemType)
    if parent == self.me and mode == VENDOR_SELLONLY then return false end
    if parent == self.vendor and mode == VENDOR_BUYONLY then return false end
    return mode ~= nil
end

function PANEL:updateItem(itemType, parent, quantity)
    assert(isstring(itemType), "itemType must be a string")
    if not self.items[parent] then return end
    local panel = self.items[parent][itemType]
    if not self:shouldItemBeVisible(itemType, parent) then
        if IsValid(panel) then panel:Remove() end
        return
    end

    if not IsValid(panel) then
        panel = parent.items:Add("VendorItem")
        panel:setItemType(itemType)
        panel:setIsSelling(parent == self.me)
        self.items[parent][itemType] = panel
    end

    if not isnumber(quantity) then quantity = parent == self.me and LocalPlayer():getChar():getInv():getItemCount(itemType) or liaVendorEnt:getStock(itemType) end
    panel:setQuantity(quantity)
    return panel
end

function PANEL:onVendorPropEdited(vendor, key)
    if key == "name" then
        self.vendor:setName(vendor:getName())
    elseif key == "scale" then
        for _, panel in pairs(self.items[self.vendor]) do
            if not IsValid(panel) then continue end
            panel:updatePrice()
        end

        for _, panel in pairs(self.items[self.me]) do
            if not IsValid(panel) then continue end
            panel:updatePrice()
        end
    end
end

function PANEL:onVendorMoneyUpdated(_, money)
    self.vendor:setMoney(money)
end

function PANEL:onVendorPriceUpdated(_, itemType, _)
    local panel = self.items[self.vendor][itemType]
    if IsValid(panel) then panel:updatePrice() end
    panel = self.items[self.me][itemType]
    if IsValid(panel) then panel:updatePrice() end
end

function PANEL:onVendorModeUpdated(_, itemType, _)
    self:updateItem(itemType, self.vendor)
    self:updateItem(itemType, self.me)
end

function PANEL:onItemStockUpdated(_, itemType)
    self:updateItem(itemType, self.vendor)
end

function PANEL:onCharVarChanged(character, key, _, newValue)
    if character ~= LocalPlayer():getChar() then return end
    if key == "money" then self.me:setMoney(newValue) end
end

function PANEL:listenForChanges()
    hook.Add("VendorMoneyUpdated", self, self.onVendorMoneyUpdated)
    hook.Add("OnCharVarChanged", self, self.onCharVarChanged)
    hook.Add("VendorItemPriceUpdated", self, self.onVendorPriceUpdated)
    hook.Add("VendorItemStockUpdated", self, self.onItemStockUpdated)
    hook.Add("VendorItemMaxStockUpdated", self, self.onItemStockUpdated)
    hook.Add("VendorItemModeUpdated", self, self.onVendorModeUpdated)
    hook.Add("VendorEdited", self, self.onVendorPropEdited)
end

function PANEL:InventoryItemAdded(item)
    self:updateItem(item.uniqueID, self.me)
end

function PANEL:InventoryItemRemoved(item)
    self:InventoryItemAdded(item)
end

function PANEL:Paint(w, h)
    lia.util.drawBlur(self, 10)
    surface.SetDrawColor(0, 0, 0, 100)
    surface.DrawRect(0, 0, w, h)
end

function PANEL:OnRemove()
    if not self.noSendExit then
        net.Start("VendorExit")
        net.SendToServer()
        self.noSendExit = true
    end

    if IsValid(lia.gui.vendorEditor) then lia.gui.vendorEditor:Remove() end
    if IsValid(lia.gui.vendorFactionEditor) then lia.gui.vendorFactionEditor:Remove() end
    self:liaDeleteInventoryHooks()
end

function PANEL:OnKeyCodePressed(_)
    local useKey = input.LookupBinding("+use", true)
    if useKey then self:Remove() end
end

vgui.Register("Vendor", PANEL, "EditablePanel")
if IsValid(lia.gui.vendor) then vgui.Create("Vendor") end
