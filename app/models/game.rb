class Game < ActiveRecord::Base
  attr_accessible :player

  belongs_to :match

  has_many :frames

  def display_roll(number)
    ''
  end

  def display_frame(number)
    frame = frames.where(:number => number).first

    if displayable_frame? frame
      return frames.take(number).reduce(0) { |sum, frame| sum + frame.score }
    else
      return ''
    end
  end

  def displayable_frame?(frame)
    return false unless frame

    if frame.first_roll && frame.second_roll
      true
    else
      false
    end
  end

end