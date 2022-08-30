require './hangmanmodel'
require './view'

class Game

  def initialize
    @view = View.new
    @state = HangmanModel.new
    # run_game
  end
  
  def run_game
    @state = HangmanModel.new
    @view.game_intro
    while @state.game_in_progress?
       # use controller to convert remaining letters to nils, and then view converts to '*'
      @view.status_update(@state.lives, @state.number_of_errors, @state.guesses.length() + 1, @state.hidden_word)
      guess = ''
      until valid_guess?(guess, @state.guesses) # this is good
        guess = @view.get_guess
      end
      @state.store_guess(guess)
      evaluate_guess(guess)
    end
    play_again?
  end

  def valid_guess?(guess, guesses) # could change to invalid_guess, 
    !(guesses.include?(guess) || guess.to_s.length() != 1 || !guess.to_s.match?(/[a-z]/))
  end

  def play_again?
    if @state.word_found?
      @view.win_message(@state.word) # did this joining in the state
    else
      @view.lose_message(@state.word)
    end
    run_game if @view.play_again_answer == 'y'
  end

  def evaluate_guess(guess)
    # check if letter is in word
    if @state.word_array.include?(guess) # could be included in a method on HangmanModel class and then called in the controller
      @view.success_message
    else
      @view.fail_message
    end
  end

end

# controller should just know about game logic, rather than any internals of the state, e.g. array or string, or how to know if guess is correct, just want to check.