function useitem(item, target)
    if GetItemCount(item, false, true) > 1 and itemcd(item) <= 0 then
        UseItemByName(item, target)
    end
end

function itemable(item)
    if GetItemCount(item, false, true) > 1 and itemcd(item) <= 0 then
        return true
    end
end
