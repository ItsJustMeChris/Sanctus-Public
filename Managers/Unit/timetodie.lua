function CalcTTD(targ)
	if UnitExists(targ) and not UnitIsDead(targ) then
		if not targetGUID[tostring(UnitGUID(targ)).."TTD"] then
			targetGUID[tostring(UnitGUID(targ)).."TTD"] = {UnitHealth(targ),UnitHealthMax(targ),GetTime(),100}
			return true
		else
			_currentLife = UnitHealth(targ)
			_currentTime = GetTime()
			timeDiff = _currentTime - targetGUID[tostring(UnitGUID(targ)).."TTD"][3]
			hpDiff = targetGUID[tostring(UnitGUID(targ)).."TTD"][1] - _currentLife
			if hpDiff > 0 then
				fullTime = timeDiff*targetGUID[tostring(UnitGUID(targ)).."TTD"][2]/hpDiff
				pastFirstTime = (targetGUID[tostring(UnitGUID(targ)).."TTD"][2] - targetGUID[tostring(UnitGUID(targ)).."TTD"][1])*timeDiff/hpDiff
				calcTime = targetGUID[tostring(UnitGUID(targ)).."TTD"][3] - pastFirstTime + fullTime - _currentTime
				if calcTime > 1 then calcTime = 1 end
				timeToDie = calcTime
				if UnitHealthMax(targ) == 1 then timeToDie = 99 end
				targetGUID[tostring(UnitGUID(targ)).."TTD"][4] = timeToDie
			end
			if hpDiff >= 0 then
				targetGUID[tostring(UnitGUID(targ)).."TTD"][1] = UnitHealth(targ)
				targetGUID[tostring(UnitGUID(targ)).."TTD"][2] = UnitHealth(targ)
				targetGUID[tostring(UnitGUID(targ)).."TTD"][3] = GetTime()
			end
			return true
		end
	end
	return false
end
