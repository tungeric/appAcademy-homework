class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    begin
        puts "Let's play a game. Repeat after me!"
        until game_over
          take_turn
        end
      rescue
        game_over_message
        reset_game
      retry
    end
    # game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if game_over
      raise 'game over!'
      game_over_message
    else
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    p @seq
    p "ready to repeat the sequence? (enter anything)"
    input = gets.chomp
    system('clear')
    p 'what was the sequence?'
    p input = parse_array(gets.chomp)
    @game_over = true if input != @seq
  end

  def parse_array(string)
    string.split(",")
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Good job!"

  end

  def game_over_message
    puts "Game Over. Try again!"
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end

a = Simon.new
a.play
