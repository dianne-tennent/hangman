require 'io/console'
require 'colorize'

class View

  def initialize
    @play_again_answer = 'y'
  end

  def game_intro
    # game welcome
    puts ' '.light_yellow.on_magenta * IO.console.winsize[1]
    puts '  Welcome to Hangman.'.light_yellow.on_magenta + ' '.light_yellow.on_magenta * (IO.console.winsize[1] - '  Welcome to Hangman.'.length())
    puts ' '.light_yellow.on_magenta * IO.console.winsize[1]
  end

  def status_update(lives, errors, rounds, hidden_word)
    puts "Round #{rounds}".black.on_light_yellow
    puts "Lives left: #{lives - errors}"
    puts "Your word is #{hidden_word}"
    puts "-".light_yellow * IO.console.winsize[1]
  end

  def get_guess()
    puts 'Guess a letter from a to z.'.light_red
    puts '-'.light_yellow * IO.console.winsize[1]
    gets.chomp.downcase
  end

  def success_message
    puts 'Good guess.'.green
    puts '-'.light_yellow * IO.console.winsize[1]
  end

  def fail_message
    puts 'Sorry, the word doesn\'t contain that letter.'.red
    puts '-'.light_yellow * IO.console.winsize[1]
  end


  def win_message(answer)
    puts 'Congrats - you won.'.green
    puts "The word was #{answer}"
  end

  def lose_message(answer)
    puts "You lost :(\nThe answer was '#{answer}'".red
  end

  def play_again_answer
    puts 'Would you like to play again? (y/n)'
    gets.chomp.downcase
  end
end