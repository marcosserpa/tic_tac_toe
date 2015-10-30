module TicTacToe

  class Player
    attr_accessor :name, :marker

    def initialize(name = nil)
      if name.nil?
        raise "============ You must enter the player name! ============"
      end

      @name = name
    end

  end

end
