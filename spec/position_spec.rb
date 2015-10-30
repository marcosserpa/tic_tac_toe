require 'position'

module TicTacToe

  describe Position do

    describe ".initialize" do
      context "when initialize with no marker" do
        it "is expected to be valid" do
          position = Position.new

          expect(position.marker).to eql('')
        end
      end

      context "when initialize with X marker" do
        it "should be valid" do
          position = Position.new("X")

          expect(position.marker).to eql('X')
        end
      end

      context "when initialize with O marker" do
        it "should be valid" do
          position = Position.new("O")

          expect(position.marker).to eql('O')
        end
      end
    end

  end

end
