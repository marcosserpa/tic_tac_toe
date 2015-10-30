require 'player'

module TicTacToe

  describe Player do

    describe '.initialize' do
      context "when not given names" do
        it "should return an error message" do
          expect{ Player.new }.to raise_error(RuntimeError, "============ You must enter the player name! ============")
        end
      end

      context "when given the names" do
        it { expect(Player.new("Player X").name).to eql("Player X") }
      end
    end

  end

end
