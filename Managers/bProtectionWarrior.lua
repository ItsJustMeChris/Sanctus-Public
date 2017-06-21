function charge(target)
    if distance("player", target) ~= nil then
        if UnitExists(target) then
            if distance("player", target) > 8 and distance("player", target) < 25 then
                return true
            else return false
            end
        end
    end
end

function tauntalla()
    local object
    for i=1,GetObjectCount() do
        object = GetObjectWithIndex(i)
      if UnitCanAttack("player", object) and UnitAffectingCombat(object) and ObjectIsType(object, 8) then
          if lineOfSight(object) and not threat("player", object) and castable(warriorprot.heroicthrow, "target") then
              cast(warriorprot.heroicthrow, object)
              Debug(ObjectName(object).." not taunted!!!!!!!!!!!!!!!")
          end
          if lineOfSight(object) and not threat("player", object) and castable(warriorprot.taunt, "target") then
              cast(warriorprot.taunt, object)
              Debug(ObjectName(object).." not taunted!!!!!!!!!!!!!!!")

          end
      end
    end
end

function threat(targ, targ2)
    return UnitDetailedThreatSituation(targ, targ2)
end

function fear(target)
    local type
    for i=1, 50 do
        type = select(5,UnitDebuff(target, i))
        if type == "Curse" or type == "Magic" or type == "Poison" then
            return true
        else
            return false
        end
    end
end
