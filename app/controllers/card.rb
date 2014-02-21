post '/add_cards' do
	@deck = Deck.create(params[:deck])
	erb :'deck/add_cards'
end

post '/card_added' do
	Card.create(params[:card])
end