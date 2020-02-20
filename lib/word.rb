class Word
	WORDS = "5desk.txt"
	attr_reader :word, :guesses, :hidden_word

	def initialize(word = "", guesses = [], hidden_word = [])
		@word = word
		@guesses = guesses
		@hidden_word = hidden_word
	end

	def select_word()
		words_file = File.open(WORDS, "r")
		words_collection = words_file.read().split()

		# iterate over the array, if the word meets the desired length
		appropriate_words = words_collection.select {|word| word.length >= 5 && word.length <= 12}

		return appropriate_words
		# Add it to another array, then select a random word out of the secord arr
		# Assign selected word to local word var
		hide_word()
	end

	def guessed_already?(guess)
		if @guesses.include?(guess)
			true
		else
			false
		end
	end

	# def make_guess(guess)
	def make_guess(guess)

		@guesses.append(guess)
		word_array = @word.chars()

		if @word.include?(guess)
			word_array.each_index do |i|
				if word_array[i] == guess
					@hidden_word[i] = guess
					# Return flag for good guess
					true
				end
			end
		else
			# Return flag for bad guess
			false
		end
	end


	# def to_hash()
	def to_hash()
		{word:@word, guesses:@guesses, hidden_word:@hidden_word}
	end

	# def to_s()
	def to_s()
		# return a string with the selected word, the guesses, and the hidden word
		"Selected word: \"#{@word},\" guesses: \"#{@guesses.join(", ")},\" hidden word: \"#{@hidden_word.join("")}.\""
	end

	private
	attr_writer :word, :guesses, :hidden_word

	def hide_word()
		@word.chars().length().times { @hidden_word.append("_")}
	end

end
