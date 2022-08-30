require 'rspec/autorun'
require './game'
require './hangmanmodel'
require './view'

describe HangmanModel do
  it 'Sets the correct number of lives' do
    state = HangmanModel.new()
    expect(state.lives).to eq(9)
  end
  it 'generates a valid word' do
    state = HangmanModel.new()
    expect(state.word_array.join('')).to match(/[a-z]/)
  end
  it 'calculates errors correctly' do
    state = HangmanModel.new()
    state.guesses = ['a', 'b', 'c']
    state.word_array = ['d', 'i', 'g']
    expect(state.number_of_errors).to eq(3)
  end
  it 'player dies when lives run out' do
    state = HangmanModel.new()
    state.guesses = ['a', 'b', 'c', 'e', 'f', 'h', 'j', 'k', 'l']
    state.word_array = ['d', 'i', 'g']
    expect(state.player_alive?).to be false
  end
  it 'word_found? returns true when all letters have been guessed' do
    state = HangmanModel.new()
    state.guesses = ['g', 'i', 'd']
    state.word_array = ['d', 'i', 'g']
    expect(state.word_found?).to be true
  end
end

describe Game do
  it 'Finds a correct guess' do
    expect_any_instance_of(HangmanModel).to receive(:word_array).and_return(['c', 'o', 'o', 'l']) # tell script that whenever we call HangmanModel it returns this word
    game = Game.new # is instantiating HangmanModel, but here we're using the hangmanmodel from above instead
    guess = 'c'
    expect_any_instance_of(View).to receive(:success_message) # when we have an instance of View we expect the success_message method to be called on it. this is here because we're telling Rspec what is going to happen, i.e. what to look for
    game.evaluate_guess(guess) # thing that causes the above expectation to happen
  end

  it 'Rejects an incorrect guess' do
    expect_any_instance_of(HangmanModel).to receive(:word_array).and_return(['c', 'o', 'o', 'l']) # tell script that whenever we call HangmanModel it returns this word
    game = Game.new # is instantiating HangmanModel, but here we're using the hangmanmodel from above instead
    guess = 'y'
    expect_any_instance_of(View).to receive(:fail_message) # when we have an instance of View we expect the success_message method to be called on it. this is here because we're telling Rspec what is going to happen, i.e. what to look for
    game.evaluate_guess(guess) # thing that causes the above expectation to happen
  end

  it 'guesses are validated: numbers, floats and non letter characters and duplicates are rejected' do
    game = Game.new
    guesses = ['a', 'b', 'c']
    invalid_guesses = ['sd', 'a', '%', 4.5, 7]
    invalid_guesses.each { |guess|
    expect(game.valid_guess?(guess, guesses)).to be false
  }
  end
end





