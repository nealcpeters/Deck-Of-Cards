require 'json'

get '/cards/:card_id/edit' do
	@card = Card.find(params[:card_id])
	@deck = Deck.find(@card.deck_id)
	erb :'card_views/edit'
end

post '/cards/:card_id/delete' do
	card = Card.find(params[:card_id])
	@deck = card.decks.first
	card.destroy
	erb :'deck_views/edit'
end

post '/cards/:card_id/edit' do
	@card = Card.find(params[:card_id])
	@card.update_attributes(params[:card])
	erb :'deck_views/edit'
end

post '/cards/:card_id/check' do
	@user = current_user
  @card = Card.find(params[:card_id])
  # Answer.create({
  #   user_id: @user.id,
  #   card_id: @card.id,

  # 	})
  if @card.term.gsub(" ", "").downcase == params[:answer].gsub(" ", "").downcase
    return {value: true, card_id: @card.id}.to_json
  else
    return {value: false, card_id: @card.id}.to_json
  end
end
