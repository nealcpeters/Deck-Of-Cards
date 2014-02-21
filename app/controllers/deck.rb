get '/my_decks' do
  erb :'/deck/my_decks'
end

get '/create_deck' do
	erb :'/deck/new'
end

post '/edit_deck' do
	@deck = Deck.create(params[:deck])
	erb :'deck/edit_deck'
end

