require 'faker'

#Users
User.create(email: "neal@neal.com", password: "neal", password_confirmation: "neal")
User.create(email: "matt@matt.com", password: "matt", password_confirmation: "matt")
User.create(email: "jay@jay.com", password: "jay", password_confirmation: "jay")
User.create(email: "lauren@lauren.com", password: "lauren", password_confirmation: "lauren")
User.create(email: "troy@troy.com", password: "troy", password_confirmation: "troy")
User.create(email: "abed@abed.com", password: "abed", password_confirmation: "abed")
User.create(email: "giraffe@zoo.com", password: "giraffe", password_confirmation: "giraffe")

#Neal's Decks
Deck.create(title: "Programming", description: "Simple Programming Terms & Definitions", user_id: 1)
Deck.create(title: "HTML", description: "Simple HTML Terms & Definitions", user_id: 1)

#Programming Cards
Card.create(term: "boolean", definition: "A data type that only has two possible values: true or false", deck_id: "1")
Card.create(term: "control flow", definition: "An if-then statement is an example of this programming concept, hint: two words", deck_id: "1")
Card.create(term: "string", definition: "A word or character is an example of this data type", deck_id: 1)
Card.create(term: "integer", definition: "A number that can be written without a fractional or decimal component", deck_id: 1)
Card.create(term: "float", definition: "A number that can only be written with a fractional or decimal component", deck_id: 1)
Card.create(term: "oop", definition: "A programming paradigm that represents concepts as objects that have data fields, hint: the answer is a three letter abbreviation", deck_id: 1)

#HTML Cards
Card.create(term: "header", definition: "This type of a tag is used for titles and words you want to stand out", deck_id: 2)
Card.create(term: "paragraph", definition: "If you're going to write long sections of words, you would use this tag", deck_id: 2)
Card.create(term: "input", definition: "You would use this tag if you're looking for information from the user", deck_id: 2)
Card.create(term: "doctype", definition: "Declares the type of document you are going to be creating.  Generally the first line of an HTML document.", deck_id: 2)
Card.create(term: "div", definition: "defines a section or division of an HTML document", deck_id: 2)
Card.create(term: "href", definition: "Represents a link's destination", deck_id: 2)

#Matt's Decks
Deck.create(title: "Ruby", description: "Simple Ruby Terms & Definitions", user_id: 2)
Deck.create(title: "CSS", description: "Simple CSS Terms & Definitions", user_id: 2)

#Ruby Cards
Card.create(term: "array", definition: "Ordered, integer-indexed collections of any objects", deck_id: 3)
Card.create(term: "hash", definition: "Dictionary-like collection of unique keys and their values", deck_id: 3)
Card.create(term: "module", definition: "A collection of methods and constants", deck_id: 3)
Card.create(term: "class", definition: "A first class object in Ruby, typically a collection of many methods grouped by idea, hint: the answer is in the definition", deck_id: 3)
Card.create(term: "#", definition: "This symbol is used to comment out lines of code", deck_id: 3)
Card.create(term: "irb", definition: "This is a REPL for Ruby", deck_id: 3)

#CSS Cards
Card.create(term: "inline", definition: "Writing CSS within HTML is known as ______ styling", deck_id: 4)
Card.create(term: "stylesheet", definition: "CSS is written in a file known as this", deck_id: 4)
Card.create(term: "cascading", definition: "The C in CSS", deck_id: 4)
Card.create(term: "margin", definition: "The spacing between an HTML element and the elements around it", deck_id: 4)
Card.create(term: "padding", definition: "The spacing between the border of an HTML element and the content within it", deck_id: 4)
Card.create(term: "hex", definition: "This type of color is represented as a six digit code", deck_id: 4)

#Round 1 for programming deck
Round.create(user_id: 1, deck_id: 1)

#Answers Round 1 on programming deck and user neal
Answer.create(card_id: 1, round_id: 1, result: true)
Answer.create(card_id: 2, round_id: 1, result: false)
Answer.create(card_id: 3, round_id: 1, result: false)
Answer.create(card_id: 4, round_id: 1, result: false)
Answer.create(card_id: 5, round_id: 1, result: true)
Answer.create(card_id: 6, round_id: 1, result: false)

#Abed's decks
Deck.create(title: "Community Trivia", description: "Trivia for the greatest sitcom currently on TV", user_id: 6)

#Community Cards
Card.create(term: "cougar town", definition: "Abed's favorite TV show. He also had a cameo in the actual show.", deck_id: 5)
Card.create(term: "football", definition: "Troy played this sport in high school", deck_id: 5)
Card.create(term: "troy and abed in the morning", definition: "The name of the morning show at Greendale", deck_id: 5)
Card.create(term: "human being", definition: "Greendale's mascot", deck_id: 5)
Card.create(term: "changnesia", definition: "Chang's ficticious disease", deck_id: 5)
Card.create(term: "inspector spacetime", definition: "Troy and Abed often dress up and act out this show.  Loosely based off of Dr. Who", deck_id: 5)
Card.create(term: "darkest timeline", definition: "In the episode Remedial Chaos Theory, Abed refers to Troy's timeline as the what?", deck_id: 5)
Card.create(term: "dreamatorium", definition: "A special play area set up in Troy and Abed's apartment", deck_id: 5)







