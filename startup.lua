auto = peripheral.wrap("left")
while true do
    turtle.select(1)
    if turtle.getItemDetail() == nil or turtle.getItemDetail().name ~= "minecraft:flint_and_steel" then
        print("FLINT AND STEEL NOT FOUND")
        print("Please place a flint and steel into the first slot")
    else
        frontItem = peripheral.wrap("front")
        if frontItem ~= nil then
            item = frontItem.getItemDetail(1)
            --print(tostring(item))
            if item ~= nil then
                if item.damage == 0 then
                    print("Using flint and steel")
                    auto.useOnBlock()
                end
            end
        end
    end
    sleep(1)
end
