local auto = peripheral.wrap("left")
local foundFuelSlot = nil
local flintAndSteelSlot = nil

local function checkInventory()
    foundFuelSlot = nil
    flintAndSteelSlot = nil
    for slot = 1, 16 do
        turtle.select(slot)
        local item = turtle.getItemDetail()
        if item ~= nil then
            if item.name == "minecraft:coal" or item.name == "minecraft:lignite" or item.name == "minecraft:charcoal" or item.name == "minecraft:wood" or item.name == "modern_industrialization:lignite_coal" then
                foundFuelSlot = slot
                break -- breaks the for loop, so we don't check other slots once found
            elseif item.name == "minecraft:flint_and_steel" and item.damage ~= 0 then
                flintAndSteelSlot = slot
                print("Flint and steel found in slot " .. slot)
            end
        end
    end
    if foundFuelSlot ~= nil then
        turtle.select(foundFuelSlot)
        turtle.refuel()
        print("Refueled with fuel from slot " .. foundFuelSlot)
    end
end

checkInventory()

while true do
    -- Check all slots for burnable fuel (coal or wood)

    if turtle.getFuelLevel() < 1 then
        checkInventory()
    end

    if turtle.getFuelLevel() < 1 then
        print("NO FUEL FOUND")
        sleep(5)
    else
        local item = turtle.getItemDetail(flintAndSteelSlot)
        if item ~= nil then
            if item.name == "minecraft:flint_and_steel" and item.damage ~= 0 then
                local frontItem = peripheral.wrap("front")
                if frontItem ~= nil then
                    local sage = frontItem.getItemDetail(1)
                    if item ~= nil then
                        if sage.damage == 0 then
                            turtle.select(flintAndSteelSlot)
                            print("Using flint and steel")
                            auto.useOnBlock()
                        end
                    end
                end
            end
        else
            -- No flint_and_steel found, so we just continue to the next iteration of the loop.
            print("No fuel or flint_and_steel found")
        end

        sleep(1)
    end
end
