
post '/cards/:card_id/delete' do
	card = Card.where(id: params[:card])
	@deck = Card.deck
	card.destroy
	erb :'deck_views/edit'
end

get '/cards/:card_id/edit' do
	@card = Card.where(id: params[:card_id])
	@deck = Deck.where(id: @card.deck_id)
	erb :'card_views/edit'
end

post '/cards/:card_id/edit' do
	@card = Card.where(id: params[:card_id])
	@card.update_attributes(params[:card])
	erb :'deck_views/edit'
end