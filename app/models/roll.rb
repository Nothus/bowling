class Roll < ActiveRecord::Base

  belongs_to :frame

  before_validation :number!

  validates_presence_of :number, :pins

  private

  def number!
    self.number = frame(true).rolls.size + 1 if number.blank?
  end

end