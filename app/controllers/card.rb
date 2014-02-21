
post '/cards/:card_id/delete' do
	card = Card.find(params[:card_id])
	@deck = card.decks.first
	card.destroy
	erb :'deck_views/edit'
end

get '/cards/:card_id/edit' do
	@card = Card.find(params[:card_id])
	@deck = Deck.find(@card.deck_id)
	erb :'card_views/edit'
end

post '/cards/:card_id/edit' do
	@card = Card.find(params[:card_id])
	@card.update_attributes(params[:card])
	erb :'deck_views/edit'
end