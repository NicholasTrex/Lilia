--------------------------------------------------------------------------------------------------------
local charMeta = lia.meta.character
--------------------------------------------------------------------------------------------------------
function charMeta:GetMaxStamina()
    local maxStamina = hook.Run("CharacterMaxStamina", self) or lia.config.DefaultStamina or 100

    return maxStamina
end
--------------------------------------------------------------------------------------------------------