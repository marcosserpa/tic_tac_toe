module TicTacToe

  class Game

    attr_reader :current_player, :other_player

    def initialize(player_x, player_o)
      @current_player, @other_player = [player_x, player_o].shuffle

      puts "#{ @current_player.name } is the first player"
    end

    def play
      board = Board.new

      begin
        board.new_board

        puts ""

        x, y = get_position

        if !board.get_position(x, y).marker.empty?
          puts "\n Position already occupied, choose another number\n"
        else
          board.set_position(x, y, current_player.marker)

          if board.finished
            puts ""
            puts " ================================= "
            puts "#{ current_player.name } won!" if board.finished == :winner
            puts "Draw!!" if board.finished == :draw
            puts " ================================= "
            puts ""

            board.new_board

            return
          else
            change
          end
        end
      end while true
    end


    private

    def get_position
      puts "#{ current_player.name }, please enter a number between 1 and 9 to mark the board"
      position = gets.chomp

      if position.to_i >= 1 && position.to_i <= 9
        mark(position)
      else
        return get_position
      end
    end

    def mark(position)
      board_positions = {
        "1" => [0, 0],
        "2" => [1, 0],
        "3" => [2, 0],
        "4" => [0, 1],
        "5" => [1, 1],
        "6" => [2, 1],
        "7" => [0, 2],
        "8" => [1, 2],
        "9" => [2, 2]
      }

      board_positions[position]
    end

    def change
      @current_player, @other_player = @other_player, @current_player
    end

  end

end
