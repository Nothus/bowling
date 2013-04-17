class Game < ActiveRecord::Base
  attr_accessible :player

  belongs_to :match

  has_many :frames

  def display_roll(number)
    roll = roll_from_number(number)

    if roll
      roll.to_s
    else
      ''
    end
  end

  def display_frame(number)
    frame = frames.where(:number => number).first

    if displayable_frame? frame
      frames.take(number).reduce(0) { |sum, frame| sum + frame.score }
    else
      ''
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

  def roll_from_number(number)
    frame_number = (number / 2.0).ceil
    frame = frames.where(:number => frame_number).first
    if frame
      if number % 2 == 1
        frame.first_roll
      else
        frame.second_roll
      end
    end
  end

end