def current_user?
  session[:user_id]
end

def current_user
  User.find(session[:user_id])
end

def percent_complete(deck)	
  round = @user.rounds.where(deck_id: deck.id).first
  if round
	  number_of_cards = Deck.find(round.deck_id).cards.count
	  return (round.answers.count / number_of_cards) * 100
	else
		return 0
	end
end
