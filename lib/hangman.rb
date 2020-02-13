class Hangman
	attr_reader :mistakes

	def initialize(mistakes = 0)
		@mistakes = mistakes
		
		@zero_mistakes = "
		   |---|
		       |
		       |
		       |
		_______|"

		@one_mistake = "
		   |---|
		   O   |
		       |
		       |
		_______|"

		@two_mistakes = "
		   |---|
		   O   |
		   |   |
		       |
		_______|"

		@three_mistakes = "
		   |---|
		   O   |
		  /|   |
		       |
		_______|"

		@four_mistakes = "
		   |---|
		   O   |
		  /|\\  |
		       |
		_______|"
		
		@five_mistakes = "
			 |---|
		   O   |
		  /|\\  |
		  /    |
		_______|"
		
		@six_mistakes = "
		   |---|
		   O   |
		  /|\\  |
		  / \\  |
		_______|"
		
   
		end

	def set_mistakes(number)
		unless number.is_a?(Integer)
			raise "Input not an Integer value"
		end
		
		self.mistakes = number
		nil
	end

# define display_status
	def draw_hangman()

		case @mistakes
		when 0
			@zero_mistakes
		when 1
			@one_mistake
		when 2
			@two_mistakes
		when 3
			@three_mistakes
		when 4
			@four_mistakes
		when 5
			@five_mistakes
		when 6
			@six_mistakes
		end
	end

	def to_s()
		self.mistakes.to_s()
	end
	
	private
	attr_writer :mistakes

end
