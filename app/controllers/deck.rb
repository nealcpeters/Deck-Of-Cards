require 'pry'
require 'pry-nav'

get '/user/:user_id/decks' do
  @decks = current_user.decks
  erb :'/deck_views/index'
end

get '/decks/new' do
	erb :'/deck_views/new'
end

post '/decks' do
  @deck = Deck.create(params[:deck])
  redirect to "/decks/edit/#{@deck.id}/"
end

get '/decks/:deck_id' do
	@deck = Deck.where(id: params[:deck_id])
	erb :'/deck_views/show'
end

get '/decks/edit/:deck_id' do
  @deck = Deck.where(id: params[:deck_id])
  erb :'/deck_views/edit'
end

post '/decks/edit/:deck_id' do
  Card.create(params[:card])
  redirect to "/decks/edit/#{params[:deck_id]}"
end

post '/decks/:deck_id/delete' do
	@deck = Deck.where(id: params[:deck_id])
	@deck.destroy
	redirect to "/users/#{current_user.id}/decks"
end