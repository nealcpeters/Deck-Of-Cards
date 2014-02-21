get '/my_decks' do
  erb :'/deck/my_decks'
end

get '/create_deck' do
	erb :'/deck/new'
end

# post 'submit_deck' do
# 	@deck = Deck.create(params[:deck])
# 	redirect to '/edit_deck'
# end

# post '/edit_deck' do
# 	@deck = card.deck unless @deck 
# 	erb :'deck/edit_deck'
# end

