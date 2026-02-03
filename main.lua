SMODS.Consumable{
	set = "Tarot",
	key = "halfing",
	loc_txt = {
		name = 'halfing consumable',
		text = { 'use on a joker to half values'}
},
	pos = { x = 10, y = 2 },
	cost = 0,

in_pool = function() return false end,

	can_use = function(self, card)
		local cards = Cryptid.get_highlighted_cards({ G.jokers }, card, 1, 1, function(card)
			return not Card.no(card, "immutable", true)
		end)
		return #cards == 1
	end,
	use = function(self, card, area, copier)
		local cards = Cryptid.get_highlighted_cards({ G.jokers }, card, 1, 1, function(card)
			return not Card.no(card, "immutable", true)
		end)
		Cryptid.manipulate(cards[1], { value = 0.5 })
	end,
	}
