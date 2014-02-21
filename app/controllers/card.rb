
post '/card_added' do

	card = Card.create(params[:card])
	@deck = card.deck
	erb :'deck/add_cards'
end

