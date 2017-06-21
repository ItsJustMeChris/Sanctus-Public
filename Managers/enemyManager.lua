function priority(target)
    if GetRaidTargetIndex(target) == 8 then
        return true
    end
end

function enemysinx(number, unit)
  local unitcount = 0
  local object
  for i=1,GetObjectCount() do
      object = GetObjectWithIndex(i)
    if ObjectExists(unit) and ObjectExists(object) and
        ObjectName(object) ~= ObjectName("player") and
        UnitAffectingCombat(object) and
            UnitIsEnemy(object, "player") and
                ObjectIsType(object, 8) and
                    distance(object, unit) < number then
      unitcount = unitcount + 1
    end
  end
    return unitcount
end


function bosscheck()
end
