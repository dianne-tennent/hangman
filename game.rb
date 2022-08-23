require './model'
require './view'

class Game

  def initialize
    @state = Model.new(9, 0, 1, [])
    @view = View.new
    @visible_word_array = get_word
    @hidden_word_array = mask_word
    @game_proper = game_proper
  end

  def game_proper
    @view.game_intro(@hidden_word_array, @state.rounds, @state.errors, @state.lives)
    until player_died || word_found
      @view.status_update(@state.lives, @state.errors, @state.rounds, @hidden_word_array)
      guess = @view.get_guess(@state.guesses)
      evaluate_guess(guess)
    end
  end_game
  end

  def end_game
    if !@hidden_word_array.include?('*')
      @view.win_message(@hidden_word_array)
    else
      @view.lose_message(@visible_word_array)
    end
  end

  def evaluate_guess(guess)
    # check if letter is in word
    if @visible_word_array.include?(guess)
      # replace the letter at that index of the blocked out word
      @visible_word_array.map.with_index {|x, i|
      if x == guess
        @hidden_word_array[i] = guess
      end
    }
    @view.success_message
    else
      increment_errors
      @view.fail_message
    end
  increment_round
  end

  def player_died
    if @state.errors >= @state.lives
      return true
    else
      return false
    end
  end

  def word_found
    !@hidden_word_array.include?('*')
  end

  def increment_round
    @state.rounds += 1
  end

  def increment_errors
    @state.errors += 1
  end

  def store_guess
    @state.guesses.append(guess)
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