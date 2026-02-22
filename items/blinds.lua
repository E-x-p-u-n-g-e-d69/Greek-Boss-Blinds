SMODS.Atlas({
	key = "blinds",
	atlas_table = "ANIMATION_ATLAS",
	path = "blinds.png",
	px = 34,
	py = 34,
	frames = 21,
})

SMODS.Blind {
    key = "alpha",
    dollars = 5,
    mult = 2,
    atlas = "blinds",
    pos = { x = 0, y = 0 },
    boss = { min = 2 },
    boss_colour = HEX("E63946"),
    calculate = function(self, blind, context)
        if not context.blind_disabled then
            if context.modify_hand then
                blind.triggered = true
                hand_chips = GreekBossBlinds.divide_chips(hand_chips, 3)
                update_hand_text({ sound = 'chips2', modded = true }, { chips = hand_chips, mult = hand_mult })
            end
        end
    end
}

SMODS.Blind {
    key = "beta",
    dollars = 5,
    mult = 2,
    atlas = "blinds",
    pos = { x = 0, y = 1 },
    boss = { min = 3 },
    boss_colour = HEX("F77F00"),
    calculate = function(self, blind, context)
        if not context.blind_disabled then
            if context.modify_hand then
                blind.triggered = true
                mult = GreekBossBlinds.divide_mult(mult, 3)
                update_hand_text({ sound = 'chips2', modded = true }, { chips = hand_chips, mult = mult })
            end
        end
    end
}
SMODS.Blind {
    key = "gamma",
    dollars = 5,
    mult = 2,
    atlas = "blinds",
    pos = { x = 0, y = 2 },
    boss = { min = 2 },
    boss_colour = HEX("FCBF49"),
    calculate = function(self, blind, context)
        if not context.blind_disabled then
            if context.press_play then
                ease_dollars(-3)
            end
        end
    end
}
SMODS.Blind {
    key = "delta",
    dollars = 5,
    mult = 2,
    atlas = "blinds",
    pos = { x = 0, y = 3 },
    boss = { min = 1 },
    boss_colour = HEX("2A9D8F"),
    calculate = function(self, blind, context)
        if not context.blind_disabled then
            if context.debuff_hand then
                local seen_ranks = {}
                for idx, card in ipairs(context.full_hand) do
                    if not seen_ranks[card:get_id()] then
                        seen_ranks[card:get_id()] = true
                    else
                        return {
                            debuff = true
                        }
                    end
                end
            end
        end
    end
}

SMODS.Blind {
    key = "zeta",
    dollars = 5,
    mult = 2,
    atlas = "blinds",
    pos = { x = 0, y = 4 },
    boss = { min = 1 },
    boss_colour = HEX("38B000"),
    calculate = function(self, blind, context)
        if not context.blind_disabled then
            if context.before then
                for idx, card in ipairs(G.hand.cards) do
                    card:set_debuff(true)
                end
            end
            if context.hand_drawn then
                for idx, card in ipairs(G.hand.cards) do
                    card:set_debuff(true)
                end
            end
        end
    end
}
SMODS.Blind {
    key = "eta",
    dollars = 5,
    mult = 2,
    atlas = "blinds",
    pos = { x = 0, y = 5 },
    boss = { min = 3 },
    boss_colour = HEX("3A86FF"),
    calculate = function(self, blind, context)
        if context.debuff_hand then
            return {
                debuff = (#context.full_hand == 5)
            }
        end
    end
}

SMODS.Blind {
    key = "theta",
    dollars = 5,
    mult = 2,
    atlas = "blinds",
    pos = { x = 0, y = 6 },
    boss = { min = 1 },
    boss_colour = HEX("4361EE"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.setting_blind then
                SMODS.change_discard_limit(-2)
            end
        end
    end,
    disable = function (self)
        SMODS.change_discard_limit(2)
    end
}

SMODS.Blind {
    key = "iota",
    dollars = 5,
    mult = 2,
    atlas = "blinds",
    pos = { x = 0, y = 7 },
    boss = { min = 1 },
    boss_colour = HEX("7209B7"),
    calculate = function(self, blind, context)
        if not context.blind_disabled then
            if context.initial_scoring_step then
                ranks = {"Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"}
                for idx, card in ipairs(context.full_hand) do
                    SMODS.change_base(card, card.suit, ranks[card:get_id()-1])
                end
            end
        end
    end
}
SMODS.Blind {
    key = "kappa",
    dollars = 5,
    mult = 2,
    atlas = "blinds",
    pos = { x = 0, y = 8 },
    boss = { min = 1 },
    boss_colour = HEX("B5179E"),
    calculate = function(self, blind, context)
        if not context.blind_disabled then
            if context.initial_scoring_step then
                suits = {"Hearts", "Diamonds", "Clubs", "Spades"}
                for idx, card in ipairs(context.full_hand) do
                    local suit = pseudorandom_element(suits, "idk")
                    SMODS.change_base(card, suit)
                end
            end
        end
    end
}

SMODS.Blind {
    key = "lambda",
    dollars = 5,
    mult = 2,
    atlas = "blinds",
    pos = { x = 0, y = 9 },
    boss = { min = 1 },
    boss_colour = HEX("F72585"),
    calculate = function(self, blind, context)
        if context.first_hand_drawn then
            seen_ranks = {}
            seen_cards = {}
        end
        if not context.blind_disabled then
            if context.initial_scoring_step then
                for idx, card in ipairs(context.full_hand) do
                    if not seen_ranks[card:get_id()] then
                        seen_ranks[card:get_id()] = true
                        seen_cards[card] = true
                    else
                        card:set_debuff(true)
                    end
                end
                for _, card in ipairs(G.playing_cards) do
                    if seen_ranks[card:get_id()] and not seen_cards[card] then
                        card:set_debuff(true)
                    end
                end
            end
        end
    end
}
SMODS.Blind {
    key = "mu",
    dollars = 5,
    mult = 2,
    atlas = "blinds",
    pos = { x = 0, y = 10 },
    boss = { min = 1 },
    boss_colour = HEX("9E0059"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.debuff_card and context.debuff_card.area ~= G.jokers and context.debuff_card:get_id() then
                if context.debuff_card:get_id() <= 5 then
                    return {
                        debuff = true
                    }
                end
            end
        end
    end
}

SMODS.Blind {
    key = "nu",
    dollars = 5,
    mult = 2,
    atlas = "blinds",
    pos = { x = 0, y = 11 },
    boss = { min = 2 },
    boss_colour = HEX("8338EC"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.modify_hand then
                mult = mod_mult(mult-G.GAME.hands[context.scoring_name].played)
                update_hand_text({ sound = 'chips2', modded = true }, { chips = hand_chips, mult = mult })
            end
        end
    end
}

SMODS.Blind {
    key = "xi",
    dollars = 5,
    mult = 2,
    atlas = "blinds",
    pos = { x = 0, y = 12 },
    boss = { min = 1 },
    boss_colour = HEX("5E60CE"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.pre_discard then
                ease_dollars(-3)
            end
        end
    end
}

SMODS.Blind {
    key = "omicron",
    dollars = 5,
    mult = 2,
    atlas = "blinds",
    pos = { x = 0, y = 13 },
    boss = { min = 2 },
    boss_colour = HEX("00B4D8"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.stay_flipped and context.to_area == G.hand and GreekBossBlinds.is_rank(context.other_card, {"3", "5", "7", "9", "Ace"})then
                return {
                    stay_flipped = true
                }
            end
        end
    end,
    disable = function(self)
        for i = 1, #G.hand.cards do
            if G.hand.cards[i].facing == 'back' then
                G.hand.cards[i]:flip()
            end
        end
        for _, playing_card in pairs(G.playing_cards) do
            playing_card.ability.wheel_flipped = nil
        end
    end
}
--[[
SMODS.Blind {
    key = "",
    dollars = ,
    mult = ,
    atlas = "blinds",
    pos = { x = , y =  },
    boss = { min =  },
    boss_colour = HEX(""),
    calculate = function(self, blind, context)

    end
}
--]]