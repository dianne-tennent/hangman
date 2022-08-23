require './model'
require './view'

class Game

  def initialize
    @state = Model.new(9)
    @view = View.new
    run_game
  end

  def run_game
    @view.game_intro

    until @state.player_died || @state.word_found 
      hidden = @state.word_array.map{ |x| !@state.guesses.include?(x) ? '*' : x }
      @view.status_update(@state.lives, @state.number_of_errors, @state.guesses.length() + 1, hidden.join(''))
      guess = @view.get_guess(@state.guesses)
      store_guess(guess)
      evaluate_guess(guess)
    end

    end_game
  end

  def end_game
    if @state.word_found
      @view.win_message(@state.word_array.join(''))
    else
      @view.lose_message(@state.word_array.join(''))
    end
  end

  def evaluate_guess(guess)
    # check if letter is in word
    if @state.word_array.include?(guess)
      @view.success_message
    else
      @view.fail_message
    end
  end

  def store_guess(guess)
    @state.guesses << guess
  end

end