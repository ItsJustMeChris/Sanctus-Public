local LoSExceptions = {
    [1]= 44566, -- Al Akir
    [2]= 46753, -- Ozumat <Fiend of the Dark Below>
    [3]= 56754, -- Shado-Pan Monastery - Azure Serpent
    [4]= 72156, -- Borrok the Devourer (Frostfire Ridge)
    [5]= 76267, -- Solar Zealot (Skyreach)
    [6]= 76379, -- Rukhran (Skyreach)
    [7]= 76585, -- Ragewing the Untamed (UBRS)
    [8]= 76973, -- Hans'gar (BRF)
    [9]= 76974, -- Franzok (BRF)
    [10]= 77182, -- Oregorger (BRF)
    [11]= 91331,-- Archimonde Phase 3 (HFC)
    [12]= 91005, -- Neltharion's Lair - Naraxas
    [13]= 91808, -- Eye of Azshara - Serpentrix
    [14]= 96028, -- Eye of Azshara - Wrath of Azshara
    [15]= 97259, -- Eye of Azshara - Blazing Hydra Spawn (Serpentrix)
    [16]= 97260, -- Eye of Azshara - Arcane Hydra Spawn (Serpentrix)
    [17]= 96759, -- Helmouth Cliffs - Helya
    [18]= 98363, -- Helmouth Cliffs - Grasping Tentacle
    [19]= 98696, -- Black Rook Hold - Illysanna Ravencrest
    [20]= 99801, -- Helmouth Cliffs - Destructor Tentacle
    [21]= 100354, -- Helmouth Cliffs - Grasping Tentacle
	[22] = 100360, -- Helmouth Cliffs - Grasping Tentacle
}

function lineOfSight(target)
    if ObjectExists("player") and ObjectExists(target) then
        local sX, sY, sZ = ObjectPosition("player");
        local oX, oY, oZ = ObjectPosition(target);
        local losFlags =  bit.bor(0x10, 0x100, 0x1)
        for i=1, #LoSExceptions do
            if ObjectExists("target") and ObjectID("target") == LoSExceptions[i] then
                return true
            end
        end
        return TraceLine(sX, sY, sZ + 2.25, oX, oY, oZ + 2.25, losFlags) == nil;
    else
        return false
    end
end
