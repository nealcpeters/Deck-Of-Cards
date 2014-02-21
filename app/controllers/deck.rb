get '/users/:user_id/decks' do
  @user = User.where(id: params[:user_id]))
  @decks = @user.decks
  erb :'/deck_views/my_decks'
end

get '/decks/new' do
	erb :'/deck_views/new'
end

post '/decks' do
  deck = Deck.create(params[:deck])
  redirect to "/decks/#{deck.id}"
end

get '/decks/:deck_id' do
  @deck = Deck.where(id: params[:deck_id])
  erb :'deck_views/edit'
end

post '/decks/:deck_id' do
  Card.create(params[:card])
  redirect to "/decks/#{params[:deck_id]}"
end
