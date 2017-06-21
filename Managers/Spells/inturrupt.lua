function inturrupt(spell, target)
    local name, subText, text, texture, startTime, endTime, isTradeSkill, castID, notInterruptible = UnitCastingInfo(target)
    local name2, subText2, text2, texture2, startTime2, endTime2, isTradeSkill2, castID2, notInterruptible2 = UnitCastingInfo(target)
    local randompercent = math.random(20, 80)
    for i=1, #inturrupts do
        enemyspell = GetSpellInfo(inturrupts[i])
        if name ~= nil or name2 ~= nil then
            local castTimeRemaining = endTime / 1000 - GetTime()
            local castTimeTotal = (endTime - startTime) / 1000
            local castTimeRemaining2 = endTime2 / 1000 - GetTime()
            local castTimeTotal2 = (endTime2 - startTime2) / 1000
            local percent = 100 - castTimeRemaining / castTimeTotal * 100
            local percent2 = 100 - castTimeRemaining2 / castTimeTotal2 * 100
            if name == enemyspell or name2 == enemyspell then
                if percent >= randompercent or percent2 >= 1 then
                    if castable(spell, target) then
                        cast(spell, target)
                    end
                end
            end
        end
    end
end

function reflect(spell, target)
    local name, subText, text, texture, startTime, endTime, isTradeSkill, castID, notInterruptible = UnitCastingInfo(target)
    local name2, subText2, text2, texture2, startTime2, endTime2, isTradeSkill2, castID2, notInterruptible2 = UnitCastingInfo(target)
    for i=1, #reflects do
        enemyspell = GetSpellInfo(i)
        if endTime ~= nil or endTime2 ~= nil then
            local castTimeRemaining = endTime / 1000 - GetTime()
            local castTimeTotal = (endTime - startTime) / 1000
            local castTimeRemaining2 = endTime2 / 1000 - GetTime()
            local castTimeTotal2 = (endTime2 - startTime2) / 1000
            local percent = 100 - castTimeRemaining / castTimeTotal * 100
            local percent2 = 100 - castTimeRemaining2 / castTimeTotal2 * 100
            local randompercent = math.random(20, 80)

            if name == enemyspell or name2 == enemyspell then
                if percent >= randompercent or percent2 >= randompercent then
                    if castable(spell, target) then
                        cast(spell, target)
                    end
                end
            end
        end
    end
end
