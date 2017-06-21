local i = 1
local spinbot = false
spinspeed = 12
local silent = false


--Get Distance Between Player And Other Unit
function distance(target1,target2)
    if ObjectExists(target1) and ObjectExists(target2) then
    local x1, y1, z1 = ObjectPosition(target1)
    local x2, y2, z2 = ObjectPosition(target2)
    return math.sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) + (z2-z1)*(z2-z1))
    end
end

function unitcasting(spell, unit)
    local spellnamechannel = select(1, UnitChannelInfo(unit))
    local spellnamecast = select(1, UnitCastingInfo(unit))
    local spellid1 = select(7, GetSpellInfo(spellnamechannel))
    local spellid2 = select(7, GetSpellInfo(spellnamecast))
    if ObjectExists(unit) then
        if UnitChannelInfo(unit) then
            if spellid1 == spell then
                return true
            end
        elseif UnitCastingInfo(unit) then
            if spellid2 == spell then
                return true
            end
        else
            return false
        end
    end
end

function togglespin()
    if spinbot then
        spinbot = false
        Print("Spinbot Disabled")
    else
        spinbot = true
        Print("Spinbot Enabled")
    end
end

function togglespinsilent()
    if silent then
        spinbot = false
        Print("Silent Spin Disabled")
    else
        silent = true
        Print("Silent Spin Enabled")
    end
end


AddTimerCallback(0.01,
  function ()
    if spinbot then
      i = i+(359/spinspeed)
      if i >= 359 then
        i = 1
      end
      local Facing = ObjectFacing("Player")
      FaceDirection(math.rad(i))
      SendMovementUpdate()
      if silent then
        FaceDirection(Facing)
      end
    end
end)
