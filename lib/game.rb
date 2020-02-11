# Import all necessary local libraries
# Import json library

# Define method for playing a match of the game
	# Create a new hangman instance
	# Create a new word instance
	# Initiate match loop
		# Draw hangman
		# Draw word
		# Draw previously selected letter
		# Ask player for a new letter
		# Initiate loop if letter is already in guesses
			# Compare letter with word
			# If letter is in word, 
				# add it to word. Break
			# Else if letter is not in word 
				# add one to mistakes and update hangman. Break
		# Check if all the spaces in guessed word have been filled
		# If true break loop

# Load word list into variable
# Using loaded list, select a word

# Initiate game loop
	# Call round method
	# Ask player if they want to play a new round
	# If answer == No Break
