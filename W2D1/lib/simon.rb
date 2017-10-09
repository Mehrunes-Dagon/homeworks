require 'io/console'
require "byebug"

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
      add_random_color
      system("clear")
      # debugger
    end

    game_over_message
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      @sequence_length += 1
      round_success_message
      # debugger
    end
  end

  # Had to change this after seeing the alternative. hahahahaha
  # def user_continue
  #   puts "Please press Space Bar to continue"
  #   STDIN.getch
  #   system("clear")
  # end

  def show_sequence
    @seq.each do |color|
      puts color
      # user_continue
      sleep 1
      system("clear")
    end
  end

  def require_sequence
    puts "Rewrite the sequence (first letter only)"
    @seq.each do |color|
      user_input = gets.chomp
      unless user_input == color[0]
        @game_over = true
        puts ":["
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "Nice!\n Next sequence:"
  end

  def game_over_message
    puts "Better luck next time!\nYou only got to #{@sequence_length - 1}. lol "
  end

end

if $PROGRAM_NAME == __FILE__
  new_game = Simon.new
  new_game.play
end
