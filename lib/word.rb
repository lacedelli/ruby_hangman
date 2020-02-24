class Word
	WORDS = "5desk.txt"
	attr_reader :word, :guesses, :hidden_word

	def initialize(word = "", guesses = [], hidden_word = [])
		@word = word
		@guesses = guesses
		@hidden_word = hidden_word
	end

	def select_word()
		if @word.empty? 
			words_file = File.open(WORDS, "r")
			words_collection = words_file.read().split()

			appropriate_words = words_collection.select do |word|
				word.length >= 5 && word.length <= 12
			end

			rand = Random.new()
			selected_word = appropriate_words[rand.rand(0..appropriate_words.length())]
			@word = selected_word.downcase()
			hide_word()
		else
			raise "Word already selected"
		end
		nil
	end

	def valid_guess?(guess)
		# Could've used a better regex solution for this
		if guess.length > 1
			false
		elsif /\d/.match?(guess)
			false
		elsif guess.empty?()
			false
		else
			true
		end
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

		@guesses.append(guess.downcase())
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

	def word_guessed?()
		if @hidden_word.join("") == @word
			true
		end
	end

	def to_hash()
		{word:@word, guesses:@guesses, hidden_word:@hidden_word}
	end

	def to_s()
		"Selected word: \"#{@word},\" guesses: \"#{@guesses.join(", ")},\" hidden word: \"#{@hidden_word.join("")}.\""
	end

	private
	attr_writer :word, :guesses, :hidden_word

	def hide_word()
		@word.chars().length().times { @hidden_word.append("_")}
	end

end
