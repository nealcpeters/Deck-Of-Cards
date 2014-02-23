require 'json'

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

get '/decks/statistics/:deck_id' do
  @all_rounds = current_user.all_stats(params[:deck_id])

  erb :'/deck_views/stats'
end

get '/decks/new_round/:deck_id' do
  @user = current_user
  @deck = Deck.find(params[:deck_id])

  @round = Round.create({
    user_id: current_user.id,
    deck_id: @deck.id
    })
  session[:round_id] = @round.id

  redirect to ("/decks/#{@deck.id}")
end

get '/decks/:deck_id' do
  @user = current_user
  @deck = Deck.find(params[:deck_id])
  if @user.rounds.where(deck_id: params[:deck_id]).empty?
    @round = Round.create({
      user_id: current_user.id,
      deck_id: @deck.id
      })
    session[:round_id] = @round.id
  end
  session[:round_id] = @user.rounds.where(deck_id: params[:deck_id]).last.id
  if request.xhr?
    erb :"deck_views/_deck_progress_bar", layout: false
  else
    erb :'/deck_views/show'
  end
end


get '/decks/:deck_id/delete' do
	@deck = Deck.find(params[:deck_id])
	@deck.destroy
	redirect to "/user/#{current_user.id}/decks"
end

post '/decks' do
  @deck = Deck.new(params[:deck])
  if @deck.save
    redirect to "/decks/edit/#{@deck.id}"
  else
    @errors = @deck.errors.messages
    erb :"deck_views/new"
  end
end

post '/decks/edit/:deck_id' do
  @deck = Deck.where(id: params[:deck_id])[0]
  card = Card.new(params[:card])
  if card.save
    redirect to "/decks/edit/#{params[:deck_id]}"
  else
    @errors = card.errors.messages
    erb :'/deck_views/edit'
  end
end

post '/decks/edit_card/:card_id' do
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:card_id])
  if @card
    @card.update(params[:card])
    if @card.save
      redirect to "/decks/edit/#{@deck.id}"
    else
      @errors = @card.errors.messages
      p @errors
      redirect to("/cards/#{@card.id}/edit")
    end
  else
    @errors = {:Invalid=>["Incorrect Information"]}
    redirect to("/cards/#{@card.id}/edit")
  end
end





