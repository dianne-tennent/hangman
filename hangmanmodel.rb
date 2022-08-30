class HangmanModel
  attr_accessor :lives, :guesses, :word_array, :word, :game_in_progress, :word_found, :hidden_word

  def initialize()
    @lives = 9
    @guesses = []
    @word = random_word
    @word_array = random_word_array(@word)
    @game_in_progress = game_in_progress?
  end

  def random_word # method name should explain what it's returning, not what it's doing, e.g. random_word or word
    # get array of words from file
    words_file = IO.readlines("words.txt")
    if words_file
      words_file.sample
    else
      throw 'Error' # give a specific error
    end
  end

  def random_word_array(word)
    word.split('')
  end

  def player_alive? # question mark method treated like a boolean, shouldn't ever change any state. Bang methods: look these up
    number_of_errors < @lives
  end

  def word_found?
    # we know the word is found if all the letters in the word exist in the guesses array
    @word_array.all? { |x| @guesses.include?(x) }
  end

  def game_in_progress?
    player_alive? && !word_found?
  end

  def number_of_errors
    # guesses that are not in the word
    @guesses.count { |x| !@word_array.include?(x)} #ruby array.count method
  end

  def hidden_word
    hidden = @word_array.map{ |x| !@guesses.include?(x) ? '*' : x }
    hidden.join('')
  end

  def store_guess(guess) # Moved here from controller: "red flag because you're modifying another class' instance variable, makes it more exposed and hard to manage. Better to expose the methods that modify them. Protect from other classes as much as possible."
    @guesses << guess
  end

end