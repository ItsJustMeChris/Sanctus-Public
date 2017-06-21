group = {}
function getGroup()
  local object
  for i=1,GetObjectCount() do
    object = GetObjectWithIndex(i)
    if group[g] == nil or group[g] ~= object then
      if UnitInRaid(object) or UnitInParty(object) then
        table.insert(group, {unit = ObjectName (object)})
      end
    end
  end
end

AddEventCallback("GROUP_ROSTER_UPDATE", function()
    table.wipe(group)
    getGroup()
    --offtank = nil
    --getofftank()
end)

AddEventCallback("GROUP_JOINED", function()
    table.wipe(group)
    getGroup()
    --offtank = nil
    --getofftank()
end)

--function getofftank()
--    local object
--    for i=1, GetObjectCount() do
--        object = GetObjectWithIndex(i)
--        if UnitInRaid("player") then
--            if offtank == nil then
--                if UnitInRaid(object) or UnitInParty(object) then
--                    if UnitGroupRolesAssigned(object) == "TANK" and not UnitIsUnit(object, "player") then
--                        Print("We found offtank, It's "..ObjectName(object))
--                        offtank = object
--                    end
--                end
--            end
--        end
--    end
--end
