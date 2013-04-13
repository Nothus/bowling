class Game < ActiveRecord::Base
  attr_accessible :player

  belongs_to :match

  has_many :frames

  def display_roll(roll)
    ''
  end

  def display_frame(frame)
    ''
  end

end