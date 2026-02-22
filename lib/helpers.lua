function GreekBossBlinds.divide_mult(mult, factor)
    return mod_mult(math.max(math.floor(mult/factor+0.5), 1))
end
function GreekBossBlinds.divide_chips(chips, factor)
    return mod_chips(math.max(math.floor(chips/factor+0.5), 1))
end
function GreekBossBlinds.roundToSignificantFigures(num, sf)
    if num == 0 then
        return 0 -- Handle the edge case of 0
    end

    -- Calculate the power of 10 representing the magnitude of the number
    local magnitude = math.floor(math.log10(math.abs(num)))

    -- Calculate the power of 10 needed for the desired significant figures
    local power = (sf - 1) - magnitude

    -- Multiply by the power of 10, round to the nearest integer, and divide back
    local mult = 10^power
    local rounded_num = math.floor(num * mult + 0.5) / mult

    return rounded_num
end
function GreekBossBlinds.is_rank(card, rankset)
    idmap = {
        [2] = "2",
        [3] = "3",
        [4] = "4",
        [5] = "5",
        [6] = "6",
        [7] = "7",
        [8] = "8",
        [9] = "9",
        [10] = "10",
        [11] = "Jack",
        [12] = "Queen",
        [13] = "King",
        [14] = "Ace"
    }
    if idmap[card:get_id()] then
        for _, rank in pairs(rankset) do
            if idmap[card:get_id()] == rank then
                return true
            end
        end
        return false
    end
    return false
end