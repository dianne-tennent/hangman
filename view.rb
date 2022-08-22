require 'io/console'

class View

  def game_intro(hidden_word_array)
    # game welcome
    puts "-" * IO.console.winsize[1]
    puts "Welcome to Hangman. Your word is #{hidden_word_array.join('')}"
    puts "-" * IO.console.winsize[1]
    puts "Round #{rounds}"
    puts "Lives left: #{LIVES - errors}"
    puts "-" * IO.console.winsize[1]
    puts "Guess a letter"
    puts "-" * IO.console.winsize[1]
  end

  def get_guess()
    guess = gets.chomp.downcase
    # add guess to guesses array if it's a valid guess
    if guesses.include?(guess) || guess.length() != 1 || !guess.match?(/[a-z]/)
      puts "Invalid guess."
    else
      return guess
    end
  end

  def check_guess()
    # check if letter is in word
    if visible_word_array.include?(guess)
      # replace the letter at that index of the blocked out word
      visible_word_array.map.with_index {|x, i|
      if x == guess
        hidden_word_array[i] = guess
      end
    }
    else
      return
  end

  def win_message()
    puts "Congrats - you won."
  end

  def lose_message()
    puts "Sorry, you lost :("
  end

end