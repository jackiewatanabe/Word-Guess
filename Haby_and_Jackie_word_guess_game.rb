

class WordGuess

  attr_accessor :user_guess, :words, :flower

  WORDS_ARRAY = [ "hello", "elephant", "gum", "glasses", "developer", "seattle", "sunshine"]

  def initialize
    @word = WORDS_ARRAY[rand(0..6)].upcase
    @flower = ["@ ","@ ","@ ","@ ","@ "]
    @chosen_word_array = @word.upcase.chars.to_a
    @secret_word = []
    @incorrect_letters = []
    new_word
    @user_guess

  end


  def new_word #Sets up initial secret word dashes
    show_flower
    @word.length.times do
      @secret_word << "_ "
    end
    show_correct_word
  end

  def show_flower # displays leftover flower buds each round
    puts
    @flower.each do |bud|
      print bud
    end
    puts
    puts ",\\,\\|/,/,"
    puts "  _\\|/_"
    puts " |_____|"
    puts "  |   |"
    puts "  |___| "
    puts
  end

  def show_correct_word # displays correct letters or unguessed letters each round
    @secret_word.each do |letter|
      print "#{letter} "
    end
  end

  def show_incorrect_guesses # displays incorrect inputs each guess
    puts "Incorrect Guesses: "
    @incorrect_letters.each do |letter|
      print letter + " "
    end
  end

  def verify_input
    while @user_guess.length > 1
      puts "Please enter a single letter. Thanks"
      @user_guess = gets.chomp.upcase
    end
  end

  def check_letters

    if @word.include?(@user_guess)
      @chosen_word_array.each_with_index do |letter, index|
        if letter == @user_guess
          @secret_word[index] = letter
        end
      end
    else
      @incorrect_letters << @user_guess
      @flower.pop
    end
    # displays leftover flower buds each round
    show_flower
    # displays correct letters or unguessed letters each round
    show_correct_word
    puts
    # displays incorrect inputs each guess
    show_incorrect_guesses
    puts
    puts
  end
  # end
  def check_word
    if @chosen_word_array == @secret_word
      puts "You Guessed It!"
      exit
    end
  end
end

puts "welcome to Word Guess!"
puts "Here is your secret word you have to guess!"
puts
newgame = WordGuess.new

while newgame.flower.length > 0
  puts "Please enter a letter: "
  newgame.user_guess = gets.chomp.upcase
  newgame.verify_input
  newgame.check_letters
  newgame.check_word
end
puts "Your plant died and you have no more guesses!"
puts "GAME OVER"
