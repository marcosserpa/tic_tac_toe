module TicTacToe

  class Board

    attr_reader :grid

		def initialize
      input = {}
			@grid = input.fetch(:grid, Array.new(3) { Array.new(3) { Position.new } })
		end

		def new_board
	    grid.each do |row|
	      puts row.map { |position| position.marker.empty? ? "_" : position.marker }.join(" ")
	    end
    end

		def get_position(x, y)
			grid[y][x]
		end

    def set_position(x, y, marker)
      position = get_position(x, y)
      position.marker = marker
		end

		def finished
      if has_winner?
        return :winner
      elsif is_draw?
        return :draw
      else
        false
      end
		end


		private

    def has_winner?
			victory_possibilities.each do |arrangement|
				next if winning_position_markers(arrangement).all?{ |element| element.to_s.empty? }
				return true if winning_position_markers(arrangement).all? { |element| element == winning_position_markers(arrangement)[0] }
			end

			false
		end

    def is_draw?
			!grid.flatten.map { |position| position.marker }.any?{ |element| element.to_s.empty? }
		end

		def winning_position_markers(position)
			position.map { |position| position.marker }
		end

    def diagonals
			[[get_position(0,0), get_position(1,1), get_position(2,2)], [get_position(0,2), get_position(1,1), get_position(2,0)]]
		end

		def victory_possibilities
			grid + grid.transpose + diagonals
		end

  end

end
