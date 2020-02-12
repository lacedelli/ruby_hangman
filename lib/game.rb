# Import all necessary local libraries
# Import json library

# Define saving method
	# get Hangman status from hangman.to_s() 
	# get Word status from word.to_hash()
	# override save.json file with gathered data

# Define method for playing a match of the game
		# Initiate match loop
		# Draw hangman
		# Draw word
		# Draw previously selected letter
		# Ask player for a new letter
		# If input == save
			# run saving method
			# puts a farewell message
			# end the app
		# Initiate loop if letter is already in guesses
			# Compare letter with word
			# If letter is in word, 
				# add it to word. Break
			# Else if letter is not in word 
				# add one to mistakes and update hangman. Break
		# Check if all the spaces in guessed word have been filled
		# If true break loop

# define load method
	# get values and load pump them into respective classes

# Initiate game loop
	# If save exists
		# Call load method
	# Else
		# Create a new hangman instance

	# Create a new word instance
	# Call round method
	# nuke saved file
	# Ask player if they want to play a new round
	# If answer == No Break
