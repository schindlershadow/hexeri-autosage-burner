auto = peripheral.wrap("left")
while true do 
    turtle.select(1)
    if turtle.getItemDetail() == nil or turtle.getItemDetail().name ~= "minecraft:flint_and_steel" then
        print("FLINT AND STEEL NOT FOUND")
        print("Please place a flint and steel into the first slot")
    else
    if frontItem ~= nil then
        item = frontItem.getItemDetail(1)
        if item ~= nil then
            print("Using flint and steel")
            if item.damage == 0 then
                auto.useOnBlock()
            end
        end
    end
    end
    sleep(1)
end