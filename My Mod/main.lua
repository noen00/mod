local mod = RegisterMod("My Mod", 1)
local damagePotion = Isaac.GetItemIdByName("stuff")
local test = Isaac.GetItemIdByName("things")
local damagePotionDamage = 10
local tearss=-100

function mod:EvaluateCache(player, cacheFlags)
    if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
        local itemCount = player:GetCollectibleNum(damagePotion)
        local damageToAdd = damagePotionDamage * itemCount
        player.Damage = player.Damage -damageToAdd
        
    end
    if cacheFlags & CacheFlag.CACHE_FIREDELAY==CacheFlag.CACHE_FIREDELAY then
        local itemCount = player:GetCollectibleNum(damagePotion)
        local thing=tearss * itemCount
        player.MaxFireDelay = player.MaxFireDelay + thing

    end
    if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
        local itemCount = player:GetCollectibleNum(test)
        local damageToAdd = damagePotionDamage * itemCount
        player.Damage = player.Damage +damageToAdd
        
    end
    if cacheFlags & CacheFlag.CACHE_FIREDELAY==CacheFlag.CACHE_FIREDELAY then
        local itemCount = player:GetCollectibleNum(test)
        local thing=tearss * itemCount
        player.MaxFireDelay = player.MaxFireDelay - thing

    end
end

mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.EvaluateCache)


local eksempe = Isaac.GetItemIdByName("eksempel")

function mod:ekssempel()
    local entities = Isaac.GetRoomEntities();
    for _, entity in ipairs(entities) do
        if entity:IsActiveEnemy()then
            entity:Kill()
        end
    end

    return {
        Discharge = true,
        Remove = false,
    }
end
function set()
    local player =Isaac.GetPlayer()
    player:NeedsCharge(ActiveSlot.SLOT_PRIMARY)
end
mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod.ekssempel, eksempe)
