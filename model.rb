class Model
  attr_accessor :lives, :errors, :rounds, :guesses 
  def initialize(lives, errors, rounds, guesses)
    @lives = lives
    @errors = errors
    @rounds = rounds
    @guesses = guesses
  end



end