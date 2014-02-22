require 'pry'
require 'pry-nav'

get '/user/:user_id/decks' do
  @decks = current_user.decks
  erb :'/deck_views/index'
end

get '/decks/new' do
	erb :'/deck_views/new'
end

get '/decks/edit/:deck_id' do
  @deck = Deck.where(id: params[:deck_id])[0]
  erb :'/deck_views/edit'
end

get '/decks/:deck_id' do
  @user = current_user
  @deck = Deck.find(params[:deck_id])
  @round = Round.create({
    user_id: current_user.id,
    deck_id: @deck.id
    })
  session[:round_id] = @round.id
  erb :'/deck_views/show'
end

post '/decks' do
  @deck = Deck.create(params[:deck])
  redirect to "/decks/edit/#{@deck.id}"
end

post '/decks/edit/:deck_id' do
  Card.create(params[:card])
  redirect to "/decks/edit/#{params[:deck_id]}"
end

get '/decks/:deck_id/delete' do
	@deck = Deck.find(params[:deck_id])
	@deck.destroy
	redirect to "/user/#{current_user.id}/decks"
end
