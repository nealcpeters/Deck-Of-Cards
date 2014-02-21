get '/users/:user_id/decks' do
  erb :'/deck_views/my_decks'
end

get '/decks/new' do
	erb :'/deck_views/new'
end

post '/decks' do
	deck = Deck.create(params[:deck])
	redirect to "/edit_deck/#{deck.id}"
end

post '/decks/:deck_id/edit' do
	Card.create(params[:card])
	redirect to "/deck/#{params[:deck_id]}/edit"
end

get '/decks/:deck_id/edit' do
	@deck = Deck.where(id: params[:deck_id])
	erb :'deck_views/edit'
end