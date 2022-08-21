require 'io/console'
## Game prep
# get array of words from file
wordsFile = IO.readlines("words.txt")
rando = rand(1..wordsFile.length())
if wordsFile
  visible_word = wordsFile[rando].chomp
else
  puts "Error"
end

# put the visible word in an array
visible_word_array = visible_word.split('')
# create the hidden word
hidden_word_array = visible_word_array.map { |c| c = '*'}
guesses = []
lives = 3

# game welcome
puts "-" * IO.console.winsize[1]
puts "Welcome to Hangman. Your word is #{hidden_word_array.join('')}"
puts "-" * IO.console.winsize[1]
puts "You have #{lives} lives"

# game loop
while guesses.length() < lives
  puts "-" * IO.console.winsize[1]
  puts "Round #{guesses.length() + 1} of #{lives}"
  puts "-" * IO.console.winsize[1]
  puts "Guess a letter"
  puts "-" * IO.console.winsize[1]

  guess = gets.chomp.downcase
  # add guess to guesses array if it's a valid guess
  if guesses.include?(guess) || guess.length() != 1 || !guess.match?(/[a-z]/)
    puts "Invalid guess."
  else
    guesses.append(guess)
  end

  # check if letter is in word
  if visible_word_array.include?(guess)
    # replace the letter at that index of the blocked out word
    visible_word_array.map.with_index {|x, i| 
      if x == guess
        hidden_word_array[i] = guess
      end
    }
    # break if all letters have been found
    if !hidden_word_array.include?('*')
      puts "Congrats - the word is #{visible_word_array.join('')}"
      break
    end

  else
    puts 'Sorry, try again.'
  end

  # end game when lives have run out
  if guesses.length() >= lives
    puts "Sorry, you lost :(\nThe answer was '#{visible_word_array.join('')}'"
  else
    puts "The word is #{hidden_word_array.join('')}"
  end
end

