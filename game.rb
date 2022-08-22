class Game

  def initialize
    @game_state = Model.new(9, 0, 1, [])
    @view = View.new
    @visible_word_array = get_word
    @hidden_word_array = mask_word
    @game_proper = game_proper
  end

  def game_proper
    @view.game_intro
    @view.get_guess
    @view.check_guess
  end

  def increment_round
    @game_state.rounds += 1
  end

  def increment_errors
    @game_state.errors += 1
  end

  def store_guess
    @game_state.guesses.append(guess)
  end

  def get_word
    # get array of words from file
    wordsFile = IO.readlines("words.txt")
    if wordsFile
      visible_word = wordsFile.sample()
      # put the visible word in an array
      visible_word.chomp.split('')
    else
      throw "Error"
    end

  end

  def mask_word
    # create the hidden word
    hidden_word_array = @visible_word_array.map { |c| c = '*'}
  end

end