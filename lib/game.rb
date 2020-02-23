require_relative "word.rb"
require_relative "hangman.rb"

require "json"

SAVE_GAME = "saved_game.json"

def load_json(hangman, word)
	# todo get values and load pump them into respective classes
end

# TODO define deletor method
def delete_saved_game()
end

# Define saving method
def save_game(hangman, word)
	hangman_number = hangman.to_s()
	word_hash = word.to_hash()

	json = JSON.dump ({
		hangman:hangman_number,
		word:{word:word_hash[:word],
					guesses:word_hash[:guesses],
					hidden_word:word_hash[:hidden_word]}
	})
	
	puts json
	# TODO code to write local file save_game.json

	# override save.json file with gathered data
	puts "Successfully saved data!"
end

# Define method for playing a match of the game
def game_match(hangman, word)
	guess = ""
	loop do
		puts hangman.draw_hangman()

		puts "Your progress in guessing the word is:"
		puts word.hidden_word.join(" ")

		puts "You have guessed the following letters:"
		puts word.guesses.join(", ")
	
		puts "Please make a new guess:" 
		puts "Or, alternatively, write \"save\" to save the game's current state."

		loop do 
		guess = gets().chomp()
			if guess == "save"
				save_game(hangman, word)
				puts "Thanks for playing! See you when you return!"
				exit(0)
			end
		break if word.valid_guess?(guess) and !word.guessed_already?(guess)
		end

		result = word.make_guess(guess)
		if result
		else
			hangman.increment_mistakes()
		end

		
		if word.word_guessed?()
			# TODO get code from file deletor method
			puts "That's correct! The word was #{word.word}!"
			break
		end
		
		if hangman.max_mistakes?
			# TODO get code from file deletor method
			puts hangman.draw_hangman()
			puts "Too bad! You lost, the word was #{word.word}!"
			break
		end
	end
end

# Initiate game loop
def start_game()

	loop do
		if File.exist?(SAVE_GAME)
			# TODO  Call load method 
		else
			hangman = Hangman.new()
			word = Word.new()
			word.select_word()
		end

		game_match(hangman, word)

		puts "Would you like to play another round? (\"n\" to quit)"
		answer = gets().chomp().downcase()
		if answer == "no" or answer == "n"
			break
		end

		save_game(hangman, word)
		break
	end
end
