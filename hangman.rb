require 'io/console'
## Game prep
# get array of words from file
wordsFile = IO.readlines("words.txt")
# rando = rand(1..wordsFile.length()) # .sample method
if wordsFile
  visible_word = wordsFile.sample()
else
  puts "Error"
end

# put the visible word in an array
visible_word_array = visible_word.chomp.split('')
puts visible_word_array.length()
# create the hidden word
hidden_word_array = visible_word_array.map { |c| c = '*'}
guesses = []
errors = 0
LIVES = 9
rounds = 1
# game welcome
puts "-" * IO.console.winsize[1]
puts "Welcome to Hangman. Your word is #{hidden_word_array.join('')}"

# game loop
while errors < LIVES
  puts "-" * IO.console.winsize[1]
  puts "Round #{rounds}"
  puts "Lives left: #{LIVES - errors}"
  puts "-" * IO.console.winsize[1]
  puts "Guess a letter"
  puts "-" * IO.console.winsize[1]

  guess = gets.chomp.downcase
  # add guess to guesses array if it's a valid guess
  if guesses.include?(guess) || guess.length() != 1 || !guess.match?(/[a-z]/)
    puts "Invalid guess."
  else
    guesses.append(guess)
    rounds += 1

    # check if letter is in word
    if visible_word_array.include?(guess)
      # replace the letter at that index of the blocked out word
      visible_word_array.map.with_index {|x, i|
      if x == guess
        hidden_word_array[i] = guess
      end
    }
      # break if all letters have been found
      if !hidden_word_array.include?('*') # try ruby arry subtraction magic
        puts "Congrats - the word is #{visible_word_array.join('')}"
        break
      end
    else
      errors += 1
      puts 'Sorry, try again.'
      puts "-" * IO.console.winsize[1]
    end
  end

  # end game when lives have run out
  if errors >= LIVES
    puts "Sorry, you lost :(\nThe answer was '#{visible_word_array.join('')}'"
  else
    puts "The word is #{hidden_word_array.join('')}"
  end
end

