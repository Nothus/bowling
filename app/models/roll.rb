class Roll < ActiveRecord::Base

  belongs_to :frame

  before_validation :number!

  validates_presence_of :number, :pins

  def to_s
    if pins == 10
      'X'
    elsif is_foul
      'F'
    elsif is_split
      "S #{pins}"
    elsif pins == 0
      '-'
    elsif number == 2 && frame.first_roll.pins + pins == 10
      '/'
    else
      pins.to_s
    end
  end

  private

  def number!
    self.number = frame(true).rolls.size + 1 if number.blank?
  end

end