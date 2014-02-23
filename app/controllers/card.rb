require 'json'

get '/cards/:card_id/edit' do
	@card = Card.find(params[:card_id])
	@deck = Deck.find(@card.deck_id)
	erb :'card_views/edit'
end

get '/cards/:card_id/delete' do
	card = Card.find(params[:card_id])
	@deck = card.deck
	card.destroy
	erb :'deck_views/edit'
end

post '/cards/:card_id/check' do
	@user = current_user
  @card = Card.find(params[:card_id])
  if @card.term.gsub(" ", "").downcase == params[:answer].gsub(" ", "").downcase
  	Answer.create({
  		card_id: @card.id,
  		round_id: session[:round_id],
  		result: true
  		})
    return {value: true, card_id: @card.id}.to_json
  else
  	Answer.create({
  		card_id: @card.id,
  		round_id: session[:round_id],
  		result: false
  		})
    return {value: false, card_id: @card.id, term: @card.term}.to_json
  end
end
