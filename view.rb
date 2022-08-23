require 'io/console'

class View

  def game_intro(hidden_word_array, rounds, errors, lives)
    # game welcome
    puts "-" * IO.console.winsize[1]
    puts "Welcome to Hangman."
    puts "-" * IO.console.winsize[1]

  end

  def status_update(lives, errors, rounds, hidden_word_array)
    puts "Lives left: #{lives - errors}"
    puts "Round #{rounds}"
    puts "Your word is #{hidden_word_array.join('')}"
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
        guesses.append(guess)
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


  def win_message(hidden_word_array)
    puts "Congrats - you won."
    puts "The word is #{hidden_word_array.join('')}"
  end

  def lose_message(visible_word_array)
    puts "You lost :(\nThe answer was '#{visible_word_array.join('')}'"
  end

end