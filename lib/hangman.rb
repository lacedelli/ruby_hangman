# Create class
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

# define setter for mistakes variable

# define display_status
	def draw_hangman(number)

		case number
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
	# returns a different string depending on the number of mistakes

# Override to_s
	# Return mistakes as a string value

# define private writer for mistakes variable
end
