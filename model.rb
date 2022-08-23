class Model
  attr_accessor :lives, :guesses, :word_array

  def initialize(lives)
    @lives = lives
    @guesses = []
    @word_array = get_word
  end

  def get_word
    # get array of words from file
    wordsFile = IO.readlines("words.txt")
    if wordsFile
      word = wordsFile.sample()
      # put word in an array
      word.chomp.split('')
    else
      throw "Error"
    end
  end

  def player_died
    number_of_errors >= @lives
  end

  def word_found
    # we know the word is found if all the letters in the word exist in the guesses array
    correct_guesses = 0
    @word_array.each{ |x|
      if @guesses.include?(x)
        correct_guesses += 1
      end
      }
    @word_array.length() == correct_guesses
  end

  def number_of_errors
    # guesses that are not in the word
    errors = []
    @guesses.each{ |x|
      if !@word_array.include?(x)
        errors << x
      end
    }
    errors.length()
  end
end