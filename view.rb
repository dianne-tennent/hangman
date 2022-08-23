require 'io/console'

class View

  def game_intro
    # game welcome
    puts "-" * IO.console.winsize[1]
    puts "Welcome to Hangman."
    puts "-" * IO.console.winsize[1]
  end

  def status_update(lives, errors, rounds, hidden_word_array)
    puts "Lives left: #{lives - errors}"
    puts "Round #{rounds}"
    puts "Your word is #{hidden_word_array}" # should give the view the joined array
    puts "-" * IO.console.winsize[1]
    puts "Guess a letter"
    puts "-" * IO.console.winsize[1]
  end

  def get_guess(guesses)
    valid = false
    while valid == false
      guess = gets.chomp.downcase
      # add guess to guesses array if it's a valid guess
      if guesses.include?(guess) || guess.length() != 1 || !guess.match?(/[a-z]/)
        puts "Invalid guess, try again."
      else
        valid = true
      end
    end
    return guess
  end

  def success_message
    puts "Good guess."
    puts "-" * IO.console.winsize[1]
  end

  def fail_message
    puts 'Sorry, the word doesn\'t contain that letter.'
    puts "-" * IO.console.winsize[1]
  end


  def win_message(answer)
    puts "Congrats - you won."
    puts "The word is #{answer}"
  end

  def lose_message(answer)
    puts "You lost :(\nThe answer was '#{answer}'"
  end

end