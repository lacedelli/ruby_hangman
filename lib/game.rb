# Import all necessary local libraries
# Import json library

# define load method
	# get values and load pump them into respective classes

# TODO define deletor method

# Define saving method
def save_game(hangman, word)
	hangman_number = hangman.to_s()
	word_hash = word.to_hash()
	# override save.json file with gathered data
	puts "Successfully saved data!"
end

# Define method for playing a match of the game
def game_match(hangman, word)
	loop do
		puts hangman.draw_hangman()

		puts "Your progress in guessing the word is:"
		puts word.hidden_word.join("")

		puts "You have guessed the following letters:"
		puts word.guesses.join(", ")
	
		puts "Please make a new guess:" 
		puts "Or, alternatively, write \"save\" to save the game's current state."

		loop do 
		guess = gets().chomp()
			if guess == "save"
				save_game(hangman, word)
				puts "Thanks for playing! See you when you return!"
				# TODO find out how to exit the program
			end
		break if word.valid_guess?(guess) and !word.guessed_already?(guess)
		end

		result = word.make_guess(guess)
		if result
			break
		else
			hangman.increment_mistakes()
			break
		end

		
		if word.word_guessed?()
			# TODO get code from file deletor method
			break
		end
		
		if word.max_mistakes?
			# TODO get code from file deletor method
			break
		end
	end
end

# Initiate game loop
	# If save exists
		# Call load method
	# Else
		# Create a new hangman instance

	# Create a new word instance
	# Call round method
	# Ask player if they want to play a new round
	# If answer == No Break
