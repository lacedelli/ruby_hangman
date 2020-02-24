require_relative "word.rb"
require_relative "hangman.rb"

require "json"

SAVE_GAME = "saved_game.json"

def load_json()
	file = File.open(SAVE_GAME, "r")
	json = file.read()
	file.close()
	hash = JSON.load(json)
	hash
end

def delete_saved_game()
	file = File.open(SAVE_GAME, "w")
	file.close()
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
	
	save_file = File.open(SAVE_GAME, "w")
	save_file.puts(json)
	save_file.close()

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
			delete_saved_game()
			puts "That's correct! The word was #{word.word}!"
			break
		end
		
		if hangman.max_mistakes?
			delete_saved_game()
			puts hangman.draw_hangman()
			puts "Too bad! You lost, the word was #{word.word}!"
			break
		end
	end
end

# Initiate game loop
def start_game()

	loop do
		if File.exists?(SAVE_GAME) and !File.empty?(SAVE_GAME)
			hash = load_json()
			w_hash = hash["word"]
			word = Word.new(w_hash["word"], w_hash["guesses"], w_hash["hidden_word"])
			hangman = Hangman.new(hash["hangman"].to_i())
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

	end
end
