function guardianDruidRotation()
    if combat("target") or combat("player") then
        if not buff(5487, "player") then
            cast(guardianSpell.bearform, "player")
        else
            inturrupt(guardianSpell.skullbash, "target")
            if castable(guardianSpell.charge, "target") then
                cast(guardianSpell.charge, "target")
                return
            end
            if itemequipped(140797) and GetItemCooldown(140797) == 0 then
                UseItemByName(GetItemInfo(140797),"target")
            end
            if itemequipped(140789) and health("player") <= 60 and GetItemCooldown(140789) == 0 then
                UseItemByName(GetItemInfo(140789),"target")
            end
            if castable(guardianSpell.lunarbeam, "target") and ((health("player") <= 70 and enemysinx(8, "player") >= 2) or (health("target") <= 20)) then
                cast(guardianSpell.lunarbeam, "target")
                return
            end
            if talent(guardianTalent.Incarnation_Guardian_of_Ursoc) and castable(guardianSpell.incarnationguardianofursoc, "target") and enemysinx(8, "player") >= 3 then
                cast(guardianSpell.incarnationguardianofursoc, "target")
                return
            end
            if castable(guardianSpell.survivalinsticts, "target") and charges(guardianSpell.survivalinsticts) >= 2 and health("player") < 75 then
                cast(guardianSpell.survivalinsticts, "player")
                return
            end
            if castable(guardianSpell.survivalinsticts, "target") and charges(guardianSpell.survivalinsticts) >= 1 and charges(guardianSpell.survivalinsticts) <= 2 and health("player") < 50 then
                cast(guardianSpell.survivalinsticts, "player")
                return
            end
            if castable(guardianSpell.barskin, "target") and not buff(guardianSpell.survivalinsticts, "player") and health("player") <= 65 then
                cast(guardianSpell.barskin, "player")
                return
            end
            if castable(guardianSpell.ironfur, "target") and power("player") > 50 then
                cast(guardianSpell.ironfur, "player")
                return
            end
            if castable(guardianSpell.markofursol, "target") and health("player") < 50 then
                cast(guardianSpell.markofursol, "player")
                return
            end
            if talent(guardianTalent.Bristling_Fur) and health("player") < 65 and castable(guardianSpell.bristlingfur, "target") and not buff(guardianSpell.survivalinsticts, "player") and not buff(guardianSpell.barskin, "player") and not buff(guardianSpell.markofursol, "player") then
                cast(guardianSpell.bristlingfur, "player")
                return
            end
            if castable(guardianSpell.frenziedregeneration, "target") and charges(guardianSpell.frenziedregeneration) >= 2 and health("player") < 75 and not buff(guardianSpell.frenziedregeneration, "player") then
                cast(guardianSpell.frenziedregeneration, "player")
            end
            if castable(guardianSpell.frenziedregeneration, "target") and charges(guardianSpell.frenziedregeneration) >= 1 and health("player") < 50 and not buff(guardianSpell.frenziedregeneration, "player") then
                cast(guardianSpell.frenziedregeneration, "player")
                return
            end
            if talent(guardianTalent.Pulverize) and castable(guardianSpell.pulverize, "target") and dbuffstack(192090, "target") > 2 then
                cast(guardianSpell.pulverize, "target")
                return
            end
            if castable(guardianSpell.mangle, "target") and buff(guardianbuff.mangle, "player") then
                cast(guardianSpell.mangle, "target")
                return
            end
            if talent(guardianTalent.Galactic_Guardian) and castable(guardianSpell.moonfire, "target") and buff(guardianbuff.galacticguardian, "player") then
                cast(guardianSpell.moonfire, "target")
                return
            end
            if castable(guardianSpell.thrash, "target") then
                cast(guardianSpell.thrash, "target")
                return
            end
            if castable(guardianSpell.swipe, "target") then
                cast(guardianSpell.swipe, "target")
                return
            end
        end
    end
end
