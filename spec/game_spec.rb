require 'game'
require 'player'
require 'board'
require 'position'

module TicTacToe

  describe Game do

    let(:player_x) { Player.new("Player X") }
    let(:player_o) { Player.new("Player O") }

    describe "#change" do
      context "started the game" do
        it "should change player current to other and vice-versa" do
          player_x.marker = 'X'
          player_o.marker = 'O'

          game = Game.new(player_x, player_o)
          current_player = game.current_player
          other_player = game.other_player
          game.send(:change)

          expect(game.current_player).to eql(other_player)
        end
      end
    end

    describe "#mark" do
      context "when given a number outside the range" do
        it "should return an informative massage" do
          game = Game.new(player_x, player_o)
          game.stub(:player_x) { player_x }

          # expect(game.get_position).should_receive(:get_position) # eql("Player X, please enter a number between 1 and 9 to mark the board")
        end
      end
    end

  end

end
