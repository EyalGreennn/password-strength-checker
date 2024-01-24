local M={}
function M.checkStrength(password)
    local length=#password
    local score=0
    if length>=8 then
        score=2
    elseif length>=6 then
        score=1
    end
    local upper=password:match("%u") ~= nil
    local upperscore=upper and 2 or 0
    local lower=password:match("%l") ~= nil
    local lowerscore=lower and 2 or 0
    local num=password:match("%d") ~= nil
    local numscore=num and 2 or 0
    local special=password:match("[%W]") ~= nil
    local specialscore=special and 2 or 0
    local total=score+upperscore+lowerscore+numscore+specialscore
    local strength
    if total>=8 then
        strength="Strong"
    elseif total>=5 then 
        strength="Moderate"
    else
        strength="Weak"
    end
    return strength
end
return M