local weaponsMenu = nil

function CreateWeaponMenu()
    weaponsMenu = NativeUI.CreateMenu("Weapon Spawn Menu", "Choose a weapon to spawn:")

    local pistolsMenu = weaponsMenu:AddSubMenu("Pistols", "Select a pistol:")
    AddWeaponToMenu(pistolsMenu, "WEAPON_PISTOL", "Pistol")
    AddWeaponToMenu(pistolsMenu, "WEAPON_COMBATPISTOL", "Combat Pistol")

    local riflesMenu = weaponsMenu:AddSubMenu("Rifles", "Select a rifle:")
    AddWeaponToMenu(riflesMenu, "WEAPON_ASSAULTRIFLE", "Assault Rifle")
    AddWeaponToMenu(riflesMenu, "WEAPON_CARBINERIFLE", "Carbine Rifle")

    weaponsMenu.OnItemSelect = function(_, _, index)
        local selectedItem = weaponsMenu:GetItemByIndex(index)
        if selectedItem then
            local weaponHash = GetHashKey(selectedItem.Text)
            TriggerServerEvent("spawnWeapon", weaponHash)
        end
    end

    weaponsMenu:Visible(true)
end

function AddWeaponToMenu(menu, weaponHash, weaponName)
    local menuItem = NativeUI.CreateItem(weaponName, "Select this weapon")
    menu:AddItem(menuItem)

    menuItem.Activated = function()
        -- Handle activation if needed
    end
end

RegisterNetEvent("openWeaponMenu")
AddEventHandler("openWeaponMenu", function()
    CreateWeaponMenu()
end)
