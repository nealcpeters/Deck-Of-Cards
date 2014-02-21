require 'faker'

10.times do
  password = (0...8).map { (65 + rand(26)).chr }.join
  User.create(email: Faker::Internet.email, password: password, password_confirmation: password)
end

i = 0

10.times do
  i += 1
  Deck.create(title: Faker::Lorem.word, description: Faker::Company.catch_phrase, user_id: i)
end

Deck.all.each do |deck|
  10.times do
    Card.create(term: Faker::Lorem.sentence(word_count = 1), definition: Faker::Lorem.sentence, deck_id: deck.id)
  end
end

10.times do
  Round.create
end

Round.all.each do |round|
  10.times do
    Answer.create(user_id: (rand(25) + 1), card_id: (rand(25) + 1), round_id: round.id, result: rand(2))
  end
end


