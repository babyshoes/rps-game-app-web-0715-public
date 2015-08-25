require 'pry'

class RPSGame
  VALID_PLAY_TYPES = [:rock, :paper, :scissors]

  attr_accessor :type, :computer_play, :player_win, :player_tie

  def initialize(type)
    # binding.pry
    if self.class.valid_play?(type)
      @type = type
    else
      raise PlayTypeError.new
    end
  end

  def self.valid_play?(type)
    VALID_PLAY_TYPES.include? type
  end

  def computer_play
    @computer_play ||= VALID_PLAY_TYPES.sample
  end

  def won?
    if (type == :rock && computer_play == :scissors) || (type == :scissors && computer_play == :paper) || (type == :paper && computer_play == :rock)
      true
    else
      false
    end
  end

  def tied?
    type == computer_play
  end

  def lost?
    !won? && !tied?
  end

  def game_outcome
    if won?
      "You won!"
    elsif tied?
      "We tied!"
    elsif lost?
      "You lost!"
    end
  end

end
