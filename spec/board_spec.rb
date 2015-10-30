require 'board'
require 'position'

module TicTacToe

  describe Board do

    describe ".initialize" do
      context "when started" do
        it "sets the grid with three rows" do
          board = Board.new

          expect(board.grid.size).to eql(3)
        end


        it "creates three positions (columns) in each row" do
          board = Board.new
          board.grid.each do |row|
            expect(row.size).to eql(3)
          end
        end
      end
    end

    describe "#grid" do
      context "after instantiated a board" do
        it "returns a valid grid" do
          board = Board.new

          expect(board.grid).to_not eql(nil)
          expect(board.grid).to_not eql('')
          expect(board.grid).to_not eql({})
        end
      end
    end

    describe "#get_position" do
      context "given a pair of x,y 'coordinates'" do
        it "returns the position based that coordinates" do
          grid = [['', '', ''], ['', 'X', ''], ['', '', '']]
          board = Board.new
          board.stub(:grid){ grid }

          expect(board.get_position(1, 1)).to eql('X')
        end
      end
    end

    describe "#set_position" do
      context "when given a pair of coordinates and the marker (player identification)" do
        it "updates the marker at that grid position with that coordinates" do
          board = Board.new
          board.send(:set_position, 0, 0, 'O')

          expect(board.get_position(0, 0).marker).to eql('O')
        end
      end
    end

    describe "#finished" do
      context "when has_winner? is true" do
        it "returns :winner" do
          board = Board.new
          board.stub(:has_winner?) { true }

          expect(board.finished).to eql(:winner)
        end
      end

      context "when is_draw? is true and has_winner? is false" do
        it "returns :draw" do
          board = Board.new
          board.stub(:has_winner?) { false }
          board.stub(:is_draw?) { true }

          expect(board.finished).to eql(:draw)
        end
      end

      context "when has_winner? and is_draw? is false" do
        it "returns false" do
          board = Board.new
          board.stub(:has_winner?) { false }
          board.stub(:is_draw?) { false }

          expect(board.finished).to be(false)
        end
      end

      let(:x) { Position.new('X') }
      let(:y) { Position.new('Y') }
      let(:empty) { Position.new }

      context "when there is no winner and is not a draw" do
        it "returns false" do
          grid = [
            [x, empty, empty],
            [y, empty, empty],
            [y, empty, empty]
          ]

          board = Board.new
          board.stub(:grid){ grid }

          expect(board.finished).to be(false)
        end
      end

      context "when one row with 3 equal markers" do
        it "returns :winner" do
          grid = [
            [x, x, x],
            [y, x, y],
            [y, y, empty]
          ]

          board = Board.new
          board.stub(:grid){ grid }

          expect(board.finished).to eql(:winner)
        end
      end

      context "when one column has 3 equal markers" do
        it "returns :winner" do
          grid = [
            [x, x, empty],
            [y, x, y],
            [y, x, y]
          ]

          board = Board.new
          board.stub(:grid){ grid }

          expect(board.finished).to eql(:winner)
        end
      end

      context "when one diagonal has 3 equal markers" do
        it "returns :winner" do
          grid = [
            [x, x, empty],
            [y, x, y],
            [y, y, x]
          ]

          board = Board.new
          board.stub(:grid){ grid }

          expect(board.finished).to eql(:winner)
        end
      end

      context "when has no row, column or diagonal with 3 eual markers" do
        it "returns :draw" do
          grid = [
            [x, y, x],
            [y, x, y],
            [y, x, y]
          ]

          board = Board.new
          board.stub(:grid){ grid }

          expect(board.finished).to eql(:draw)
        end
      end

    end

  end

end
