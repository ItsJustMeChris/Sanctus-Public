function cast(spell, target)
    local spellname = GetSpellInfo(spell)
    local x,y,z = ObjectPosition(target)
    CastSpellByName(spellname,target)
    if IsAoEPending() then
        SetCVar("deselectOnClick", "0")
        ClickPosition(x,y,z,true)
        SetCVar("deselectOnClick", "1")
    end
end

function castable(cd, tar)
    if GetUnitSpeed("player") <= 10 then
        if ObjectExists(tar) and (IsPlayerMoving() and movecast(cd) or movecast(cd)) and levelcheck(cd) and IsUsableSpell(cd) and lineOfSight(tar) and not UnitIsDeadOrGhost(tar) and spellcd(cd) == 0 and cd == nil and distcheck(cd, tar) and not UnitChannelInfo("player") and not UnitCastingInfo("player") then
            return true
        elseif not UnitIsDeadOrGhost(tar) and movecast(cd) and levelcheck(cd) and lineOfSight(tar) and IsUsableSpell(cd) and spellcd(cd) == 0 and distcheck(cd, tar) and not UnitChannelInfo("player") and not UnitCastingInfo("player") then
            return true
        else

            return false
        end
    end
end



function distcheck(spell, targ)
    local spellmindist = select(5, GetSpellInfo(spell))
    local spellmaxdist = select(6, GetSpellInfo(spell))
    local maxdist = spellmaxdist + UnitBoundingRadius(targ) + UnitCombatReach(targ)
    if ObjectExists(targ) then
        if distance(targ, "player") - UnitCombatReach(targ) - UnitBoundingRadius(targ) >= spellmindist + UnitBoundingRadius(targ) and distance(targ, "player") <= maxdist then
            return true
        elseif spellmindist == 0 and spellmaxdist == 0 then
            if distance(targ, "player") >= 0 and distance(targ, "player") <= 5 + maxdist then
                return true
            end
        elseif spellmindist == 0 and spellmaxdist > 0 then
            if distance(targ, "player") >= 0 and distance(targ, "player") <= 1 + maxdist then
                return true
            end
        else
            return false
        end
    else
        return false
    end
end

function petcast(id, tar)
    local spell = GetSpellInfo(id)
    for i=1, NUM_PET_ACTION_SLOTS do
        if GetPetActionInfo(i) == spell then
            CastPetAction(i, tar)
        end
    end
end

function levelcheck(spell)
    if UnitLevel("player") >= GetSpellLevelLearned(spell) then
        return true
    else
        return false
    end
end

function casttime(spell)
    local castingtime = select(4, GetSpellInfo(spell))
    return castingtime*.001
end

function movecast(spell)
    local castingtime = select(4, GetSpellInfo(spell))
    if castingtime >= 0 and not IsPlayerMoving() then
        return true
    elseif castingtime == 0 and IsPlayerMoving() then
        return true
    else
        return false
     end
end
