    function click(tar)
      local x,y,z = ObjectPosition(tar)
      SetCVar("deselectOnClick", "0")
      ClickPosition(x,y,z,true)
      ClickPosition(x,y,z,false)
      SetCVar("deselectOnClick", "1")
    end

    function rclick(x,y,z)
            ClickPosition(x,y,z,true)
    end
