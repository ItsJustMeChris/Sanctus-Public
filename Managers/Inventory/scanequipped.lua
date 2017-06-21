function itemequipped(item)
    for i=1,19 do
        if GetInventoryItemID("player", i) == item then
            return true
        end
    end
end
