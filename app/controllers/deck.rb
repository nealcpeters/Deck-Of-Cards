get '/create_deck' do
  erb :'/deck/create_deck'
end

post '/add_cards' do
	@deck = Deck.create(params[:deck])
	erb :'deck/add_cards'
end
